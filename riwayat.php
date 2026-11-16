<?php
include "header.php";
$id = (int)($_GET['id'] ?? 0); $pesan = "";
if (isset($_GET['baru'])) { $pesan = "Pasien baru tersimpan. Catat kunjungan pertamanya di bawah."; }

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (($_POST['aksi'] ?? '') === 'kunjungan') {
    $n  = (int)$db->query("SELECT COUNT(*) AS n FROM kunjungan WHERE tanggal=CURDATE()")->fetch_assoc()['n'] + 1;
    $no = sprintf("A-%03d", $n);
    $uid = $_SESSION['uid'] ?? null;
    $st = $db->prepare("INSERT INTO kunjungan (pasien_id,tanggal,poli,metode,diagnosis,jam_daftar,no_antrean,status,petugas_id) VALUES (?,CURDATE(),?,?,?,NOW(),?,'Menunggu',?)");
    $st->bind_param("issssi", $id, $_POST['poli'], $_POST['metode'], $_POST['diagnosis'], $no, $uid);
    $st->execute();
    $pesan = "Pendaftaran dicatat. Nomor antrean: $no.";
  } elseif (($_POST['aksi'] ?? '') === 'hapus') {
    $kid = (int)$_POST['kid'];
    $st = $db->prepare("DELETE FROM kunjungan WHERE id=? AND pasien_id=?");
    $st->bind_param("ii", $kid, $id); $st->execute();
    $pesan = "Kunjungan dihapus.";
  }
}
$st = $db->prepare("SELECT * FROM pasien WHERE id=?");
$st->bind_param("i", $id); $st->execute();
$p = $st->get_result()->fetch_assoc();
$st = $db->prepare("SELECT poli, diagnosis FROM kunjungan WHERE pasien_id=? ORDER BY tanggal DESC, id DESC LIMIT 1");
$st->bind_param("i", $id); $st->execute();
$last = $st->get_result()->fetch_assoc();
$st = $db->prepare("SELECT k.*, pt.nama AS petugas FROM kunjungan k LEFT JOIN petugas pt ON pt.id=k.petugas_id WHERE k.pasien_id=? ORDER BY k.tanggal DESC, k.id DESC");
$st->bind_param("i", $id); $st->execute();
$rk = $st->get_result();
function mnt($v) { return $v === null ? "-" : e($v) . " mnt"; }
?>
<?php if (!$p): ?>
  <h2>Pasien tidak ditemukan</h2>
<?php else: ?>
<h2><?= e($p['nama']) ?></h2>
<p class="sub">No RM <b><?= e($p['no_rm']) ?></b> · <?= e($p['jk']) ?> · <?= (int)$p['umur'] ?> tahun · <?= e($p['penjamin']) ?></p>
<?php if ($pesan): ?><div class="ok"><?= e($pesan) ?></div><?php endif; ?>

<div class="card">
  <h3>Daftarkan kunjungan baru</h3>
  <form method="post" class="form">
    <input type="hidden" name="aksi" value="kunjungan">
    <label>Poliklinik<select name="poli">
      <?php foreach (["Umum","Penyakit Dalam","Anak","Jantung","Mata","Saraf","Bedah","THT","Gigi","Kulit"] as $x) echo "<option" . (($last['poli'] ?? '') === $x ? " selected" : "") . ">$x</option>"; ?>
    </select></label>
    <label>Metode registrasi<select name="metode"><option>Mobile App</option><option>APM / Kiosk Mandiri</option><option>Loket Konvensional</option></select></label>
    <label>Diagnosis<input name="diagnosis" value="<?= e($last['diagnosis'] ?? '') ?>" required placeholder="Contoh: I10 - Hipertensi"></label>
    <label><button class="pri">Daftarkan ke antrean</button></label>
  </form>
  <p class="sub" style="margin:10px 0 0">Jam daftar, waktu tunggu, dan durasi layanan dicatat otomatis oleh sistem.</p>
</div>

<div class="card scroll">
  <h3>Riwayat kunjungan</h3>
  <table>
    <tr><th>Tanggal</th><th>Jam daftar</th><th>No. antrean</th><th>Poli</th><th>Metode</th><th>Diagnosis</th><th>Waktu tunggu</th><th>Durasi layanan</th><th>Status</th><th>Petugas</th><th></th>
    <?php while ($k = $rk->fetch_assoc()): ?>
    <tr>
      <td><?= e($k['tanggal']) ?></td>
      <td><?= $k['jam_daftar'] ? e(date('H:i', strtotime($k['jam_daftar']))) : '-' ?></td>
      <td><b><?= e($k['no_antrean']) ?></b></td><td><?= e($k['poli']) ?></td><td><?= e($k['metode']) ?></td>
      <td><?= e($k['diagnosis']) ?></td><td><?= mnt($k['waktu_admisi']) ?></td><td><?= mnt($k['durasi_layanan']) ?></td>
      <td><span class="st st-<?= e($k['status']) ?>"><?= e($k['status']) ?></span></td>
      <td><?= e($k['petugas'] ?? '-') ?></td>
      <td><form method="post" onsubmit="return confirm('Hapus kunjungan ini?')">
        <input type="hidden" name="aksi" value="hapus"><input type="hidden" name="kid" value="<?= (int)$k['id'] ?>">
        <button class="del">Hapus</button></form></td>
    </tr>
    <?php endwhile; ?>
  </table>
</div>
<?php endif; ?>
<p><a href="pasien.php">← Kembali ke data pasien</a></p>
<?php include "footer.php"; ?>