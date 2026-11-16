<?php
include "header.php";
$s = $db->query("SELECT (SELECT COUNT(*) FROM pasien) AS pasien, (SELECT COUNT(*) FROM pasien WHERE penjamin='BPJS') AS bpjs, COUNT(*) AS kunj, ROUND(AVG(waktu_admisi),1) AS adm, ROUND(AVG(durasi_layanan),1) AS dur FROM kunjungan")->fetch_assoc();
$m = $db->query("SELECT metode, ROUND(AVG(waktu_admisi),1) AS rata, COUNT(*) AS n FROM kunjungan WHERE waktu_admisi IS NOT NULL GROUP BY metode ORDER BY rata");
?>
<h2>Ringkasan Operasional Rawat Jalan</h2>
<p class="sub">Sistem Informasi Pendaftaran dan Antrean Rawat Jalan Berbasis Web.</p>
<div class="grid">
  <div class="card"><h3>Total pasien</h3><p class="stat"><?= (int)$s['pasien'] ?></p></div>
  <div class="card"><h3>Total kunjungan</h3><p class="stat"><?= (int)$s['kunj'] ?></p></div>
  <div class="card"><h3>Pasien BPJS</h3><p class="stat"><?= (int)$s['bpjs'] ?></p></div>
  <div class="card"><h3>Rata-rata waktu tungggu</h3><p class="stat"><?= e($s['adm'] ?? 0) ?> mnt</p></div>
  <div class="card"><h3>Rata-rata durasi layanan</h3><p class="stat"><?= e($s['dur'] ?? 0) ?> mnt</p></div>
</div>
<div class="card"><h3>Waktu tungggu per metode</h3>
<?php while ($r = $m->fetch_assoc()): ?>
  <div class="bar"><span><?= e($r['metode']) ?> (<?= (int)$r['n'] ?> kunjungan)</span>
  <div class="track"><i style="width:<?= min(100, $r['rata']/25*100) ?>%"></i></div><b><?= e($r['rata']) ?> mnt</b></div>
<?php endwhile; ?>
</div>
<div class="banner"><h4>Status Integrasi SIMRS</h4>
<p>Pendaftaran lewat <b>Mobile App</b> dan <b>APM Mandiri</b> memangkas waktu tunggu dibanding loket konvensional.</p></div>
<?php include "footer.php"; ?>