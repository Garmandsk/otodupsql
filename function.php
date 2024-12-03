<?php
include 'config.php'; // Memuat koneksi PDO

function ambilData($query) {
    global $conn; // Menggunakan koneksi PDO global
    $stmt = $conn->prepare($query); // Menyiapkan query
    $stmt->execute(); // Menjalankan query
    $rows = [];

    // Mengambil semua hasil sebagai array asosiatif
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $rows[] = $row;
    }

    return $rows; // Mengembalikan hasil
}
?>
