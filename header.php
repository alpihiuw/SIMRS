<?php
include "koneksi.php";
$hal = basename($_SERVER['PHP_SELF']);
if (empty($_SESSION['login'])) { header("Location: login.php"); exit; }
?>
<!DOCTYPE html>
<html lang="id"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MediQueue</title><link rel="stylesheet" href="style.css"></head>
<body>
<header class="top"><h1>MediQueue</h1>
<nav>
<a href="index.php" class="<?= $hal=='index.php'?'on':'' ?>">Dashboard</a>
<a href="pasien.php" class="<?= $hal=='pasien.php'?'on':'' ?>">Pasien</a>
<a href="antrean.php" class="<?= $hal=='antrean.php'?'on':'' ?>">Antrean</a>
<span class="who">👤 <?= e($_SESSION['nama'] ?? '') ?></span>
<a href="logout.php">Keluar</a>
</nav></header>
<main class="container">