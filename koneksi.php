<?php
session_start();
ob_start();
$db = new mysqli("localhost", "root", "", "db_simrs");
if ($db->connect_error) {
    die("Koneksi gagal: " . $db->connect_error);
} function e($s){ return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }
?>