<?php
$host = "localhost";
$dbname = "otodu";
$user = "root"; // Sesuaikan dengan username PostgreSQL Anda
$pass = "";     // Sesuaikan dengan password PostgreSQL Anda

try {
    // Membuat koneksi dengan PDO
    $dsn = "pgsql:host=$host;dbname=$dbname";
    $conn = new PDO($dsn, $user, $pass);

    // Set atribut error handling
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Koneksi berhasil!";
} catch (PDOException $e) {
    // Menangkap error jika terjadi
    echo "Koneksi gagal: " . $e->getMessage();
}
?>