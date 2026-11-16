<?php
include "header.php";
$urut  = ["Menunggu","Dipanggil","Diperiksa","Selesai"];
$label = ["Menunggu"=>"Panggil","Dipanggil"=>"Mulai periksa","Diperiksa"=>"Selesai"];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $id = (int)$_POST['id'];
  $st = $db->prepare("SELECT status FROM kunjungan WHERE id=?");
  $st->bind_param("i", $id); $st->execute();
  $r = $st->get_result()->fetch_assoc();
  if ($r) {
    $i = array_search($r['status'], $urut);
    if ($i !== false && $i < 3) {
      $baru = $urut[$i+1];
      if ($baru === 'Dipanggil') {
        $sql = "UPDATE kunjungan SET status=?, jam_dipanggil=NOW(), waktu_admisi=ROUND(TIMESTAMPDIFF(SECOND, jam_daftar, NOW())/60,1) WHERE id=?";
      } elseif ($baru === 'Diperiksa') {
        $sql = "UPDATE kunjungan SET status=?, jam_mulai=NOW() WHERE id=?";
      } else {
        $sql = "UPDATE kunjungan SET status=?, jam_selesai=NOW(), durasi_layanan=ROUND(TIMESTAMPDIFF(SECOND, jam_mulai, NOW())/60,1) WHERE id=?";
      }
      $st = $db->prepare($sql);
      $st->bind_param("si", $baru, $id); $st->execute();
    }
  }
}
$hit = [];
foreach ($urut as $s) {
  $st = $db->prepare("SELECT COUNT(*) AS n FROM kunjungan WHERE status=? AND tanggal=CURDATE()");
  $st->bind_param("s", $s); $st->execute();
  $hit[$s] = (int)$st->get_result()->fetch_assoc()['n'];
}
$panggil = $db->query("SELECT k.no_antrean, k.poli, p.nama FROM kunjungan k JOIN pasien p ON p.id=k.pasien_id WHERE k.status='Dipanggil' AND k.tanggal=CURDATE() ORDER BY k.id LIMIT 1")->fetch_assoc();

$f = $_GET['poli'] ?? '';
$sql = "SELECT k.id, k.no_antrean, k.poli, k.status, k.jam_daftar, p.nama FROM kunjungan k JOIN pasien p ON p.id=k.pasien_id WHERE k.status<>'Selesai' AND k.tanggal=CURDATE()";
if ($f !== '') {
  $st = $db->prepare($sql . " AND k.poli=? ORDER BY k.id");
  $st->bind_param("s", $f);
} else {
  $st = $db->prepare($sql . " ORDER BY k.id");
}
$st->execute(); $rs = $st->get_result();
$poli = $db->query("SELECT DISTINCT poli FROM kunjungan ORDER BY poli");
?>
<h2>Antrean Hari Ini</h2>
<p class="sub">Petugas memanggil pasien dan mengubah status. Waktu tunggu dan durasi layanan dihitung otomatis.</p>

<div class="grid" style="grid-template-columns:repeat(auto-fit,minmax(240px,1fr))">
  <div class="call">
    <div>Sedang dipanggil</div>
    <div class="n"><?= $panggil ? e($panggil['no_antrean']) : "-" ?></div>
    <div><?= $panggil ? e($panggil['nama']) . " · Poli " . e($panggil['poli']) : "Belum ada" ?></div>
  </div>
  <div class="card"><h3>Menunggu</h3><p class="stat"><?= $hit['Menunggu'] ?></p></div>
  <div class="card"><h3>Diperiksa</h3><p class="stat"><?= $hit['Diperiksa'] ?></p></div>
  <div class="card"><h3>Selesai</h3><p class="stat"><?= $hit['Selesai'] ?></p></div>
</div>

<div class="card">
  <div class="chips">
    <a href="antrean.php" class="<?= $f === '' ? 'on' : '' ?>">Semua poli</a>
    <?php while ($pl = $poli->fetch_assoc()): ?>
      <a href="?poli=<?= urlencode($pl['poli']) ?>" class="<?= $f === $pl['poli'] ? 'on' : '' ?>"><?= e($pl['poli']) ?></a>
    <?php endwhile; ?>
  </div>
  <div class="scroll"><table>
    <tr><th>No. antrean</th><th>Jam daftar</th><th>Pasien</th><th>Poli</th><th>Status</th><th></th></tr>
    <?php while ($r = $rs->fetch_assoc()): ?>
    <tr>
      <td><b><?= e($r['no_antrean']) ?></b></td>
      <td><?= $r['jam_daftar'] ? e(date('H:i', strtotime($r['jam_daftar']))) : '-' ?></td>
      <td><?= e($r['nama']) ?></td><td><?= e($r['poli']) ?></td>
      <td><span class="st st-<?= e($r['status']) ?>"><?= e($r['status']) ?></span></td>
      <td><form method="post">
        <input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
        <button class="pri"><?= e($label[$r['status']]) ?></button>
      </form></td>
    </tr>
    <?php endwhile; ?>
  </table></div>
</div>
<?php include "footer.php"; ?>