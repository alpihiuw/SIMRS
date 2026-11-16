<?php
include "header.php";
$pesan = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (($_POST['aksi'] ?? '') === 'hapus') {
    $id = (int)$_POST['id'];
    $st = $db->prepare("DELETE FROM pasien WHERE id=?");
    $st->bind_param("i", $id); $st->execute();
    $pesan = "Pasien beserta riwayat kunjungannya dihapus.";
  } elseif (($_POST['aksi'] ?? '') === 'tambah') {
    $n  = (int)$db->query("SELECT COALESCE(MAX(id),0)+1 AS n FROM pasien")->fetch_assoc()['n'];
    $rm = sprintf("RM-2026-%03d", $n);
    $umur = (int)$_POST['umur'];
    $st = $db->prepare("INSERT INTO pasien (no_rm,nama,jk,umur,penjamin) VALUES (?,?,?,?,?)");
    $st->bind_param("sssis", $rm, $_POST['nama'], $_POST['jk'], $umur, $_POST['penjamin']);
    $st->execute();
    header("Location: riwayat.php?id=" . $db->insert_id . "&baru=1"); exit;
  }
}
$q = $_GET['q'] ?? ''; $f = $_GET['f'] ?? ''; $like = "%$q%";
$sql = "SELECT p.*, (SELECT COUNT(*) FROM kunjungan k WHERE k.pasien_id=p.id) AS jml FROM pasien p WHERE (p.nama LIKE ? OR p.no_rm LIKE ?)";
$par = [$like, $like]; $tp = "ss";
if ($f === 'BPJS' || $f === 'Umum') { $sql .= " AND p.penjamin=?"; $par[] = $f; $tp .= "s"; }
$st = $db->prepare($sql . " ORDER BY p.id");
$st->bind_param($tp, ...$par); $st->execute(); $rs = $st->get_result();
$filters = [''=>'Semua','BPJS'=>'BPJS','Umum'=>'Umum'];
?>
<h2>Data Pasien</h2>
<p class="sub">Satu baris = satu pasien (satu No RM). Riwayat kunjungan dilihat lewat tombol Riwayat.</p>
<?php if ($pesan): ?><div class="ok"><?= e($pesan) ?></div><?php endif; ?>

<div class="card">
  <form method="get" class="cari">
    <input name="q" value="<?= e($q) ?>" placeholder="Cari nama atau No RM...">
    <input type="hidden" name="f" value="<?= e($f) ?>">
    <button class="pri">Cari</button>
  </form>
  <div class="chips">
    <?php foreach ($filters as $k => $v): ?>
      <a href="?f=<?= urlencode($k) ?>&q=<?= urlencode($q) ?>" class="<?= $f === $k ? 'on' : '' ?>"><?= e($v) ?></a>
    <?php endforeach; ?>
  </div>
</div>

<div class="card scroll"><table>
  <tr><th>No RM</th><th>Nama</th><th>L/P</th><th>Umur</th><th>Penjamin</th><th>Kunjungan</th><th></th></tr>
  <?php while ($r = $rs->fetch_assoc()): ?>
  <tr>
    <td><b><?= e($r['no_rm']) ?></b></td><td><?= e($r['nama']) ?></td><td><?= e($r['jk']) ?></td><td><?= (int)$r['umur'] ?></td>
    <td><span class="tag"><?= e($r['penjamin']) ?></span></td><td><?= (int)$r['jml'] ?>x</td>
    <td>
      <a class="edit" href="riwayat.php?id=<?= (int)$r['id'] ?>">Riwayat</a>
      <a class="edit" href="edit.php?id=<?= (int)$r['id'] ?>">Edit</a>
      <form method="post" onsubmit="return confirm('Hapus pasien dan semua riwayat kunjungannya?')">
        <input type="hidden" name="aksi" value="hapus">
        <input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
        <button class="del">Hapus</button>
      </form>
    </td>
  </tr>
  <?php endwhile; ?>
</table></div>

<div class="card">
  <h3>Pasien baru</h3>
  <form method="post" class="form">
    <input type="hidden" name="aksi" value="tambah">
    <label>Nama<input name="nama" required></label>
    <label>Umur<input name="umur" type="number" min="0" max="120" required></label>
    <label>L/P<select name="jk"><option>L</option><option>P</option></select></label>
    <label>Penjamin<select name="penjamin"><option>BPJS</option><option>Umum</option></select></label>
    <label><button class="pri">Simpan dan catat kunjungan</button></label>
  </form>
</div>
<?php include "footer.php"; ?>