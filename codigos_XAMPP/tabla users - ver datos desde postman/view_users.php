<?php
require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $stmt = $pdo->query("CALL GetUsers()");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}
?>