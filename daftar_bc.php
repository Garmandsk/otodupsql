<?php
include 'config.php'; // Menggunakan koneksi yang sudah dibuat

if (isset($_GET['id_materi'])) {
    $id_materi = intval($_GET['id_materi']);

    // Query dengan prepared statement
    $query = "SELECT * FROM bab WHERE kode_materi = :id_materi";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id_materi', $id_materi, PDO::PARAM_INT);
    $stmt->execute();

    $data = [];

    if ($stmt->rowCount() > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
    } else {
        $data[] = ['kode_bab' => 0, 'nama_bab' => 'Tidak ada bab', 'kode_materi' => 0];
    }

    echo json_encode($data);
}

if (isset($_GET['id_bab'])) {
    $id_bab = intval($_GET['id_bab']);

    // Query dengan prepared statement
    $query = "SELECT * FROM subbab WHERE kode_bab = :id_bab";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id_bab', $id_bab, PDO::PARAM_INT);
    $stmt->execute();

    $data = [];

    if ($stmt->rowCount() > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
    } else {
        $data[] = ['id_subbab' => 0, 'nama_subbab' => 'Tidak ada subbab', 'id_bab' => 0];
    }

    echo json_encode($data);
}

// Menutup koneksi setelah selesai
$conn = null;
?>