<?php
include "koneksi.php";
$err = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $st = $db->prepare("SELECT * FROM petugas WHERE username=?");
  $st->bind_param("s", $_POST['username']);
  $st->execute();
  $u = $st->get_result()->fetch_assoc();
  if ($u && password_verify($_POST['password'], $u['password'])) {
    $_SESSION['login'] = true;
    $_SESSION['uid']   = (int)$u['id'];
    $_SESSION['nama']  = $u['nama'];
    header("Location: index.php"); exit;
  } else { $err = "Username atau password salah."; }
}
?>
<!DOCTYPE html>
<html lang="id"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Masuk - MediQueue</title><link rel="stylesheet" href="style.css"></head>
<body><div class="login"><div class="card">
<h2>MediQueue</h2>
<p class="sub">Sistem Informasi Pendaftaran dan Antrean Rawat Jalan Berbasis Web</p>
<?php if ($err): ?><div class="err"><?= e($err) ?></div><?php endif; ?>
<form method="post" class="form1">
<label>Username<input name="username" required></label>
<label>Password<input name="password" type="password" required></label>
<button class="pri">Masuk</button>
</form>
</div></div></body></html>