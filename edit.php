<?php
include "header.php";
$id = (int)($_GET['id'] ?? 0); $pesan = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $umur = (int)$_POST['umur'];
  $st = $db->prepare("UPDATE pasien SET nama=?, jk=?, umur=?, penjamin=? WHERE id=?");
  $st->bind_param("ssisi", $_POST['nama'], $_POST['jk'], $umur, $_POST['penjamin'], $id);
  $st->execute();
  $pesan = "Data pasien berhasil diubah.";
}
$st = $db->prepare("SELECT * FROM pasien WHERE id=?");
$st->bind_param("i", $id); $st->execute();
$p = $st->get_result()->fetch_assoc();
function opsi($daftar, $dipilih) {
  foreach ($daftar as $x) { echo "<option" . ($x === $dipilih ? " selected" : "") . ">" . e($x) . "</option>"; }
}
?>
<h2>Edit Data Pasien</h2>
<?php if (!$p): ?>
  <p class="sub">Data tidak ditemukan.</p>
<?php else: ?>
  <p class="sub">No RM: <b><?= e($p['no_rm']) ?></b></p>
  <?php if ($pesan): ?><div class="ok"><?= e($pesan) ?></div><?php endif; ?>
  <div class="card">
    <form method="post" class="form">
      <label>Nama<input name="nama" value="<?= e($p['nama']) ?>" required></label>
      <label>Umur<input name="umur" type="number" min="0" max="120" value="<?= (int)$p['umur'] ?>" required></label>
      <label>L/P<select name="jk"><?php opsi(["L","P"], $p['jk']); ?></select></label>
      <label>Penjamin<select name="penjamin"><?php opsi(["BPJS","Umum"], $p['penjamin']); ?></select></label>
      <label><button class="pri">Simpan perubahan</button></label>
    </form>
  </div>
<?php endif; ?>
<p><a href="pasien.php">← Kembali ke data pasien</a></p>
<?php include "footer.php"; ?>