<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['user_id'])) {
        $pdo = conectar();
        $stmt = $pdo->prepare("UPDATE User SET state = 1 WHERE id = ?");
        $stmt->execute([$data['user_id']]);
        echo json_encode(['message' => 'Usuario activado']);
    } else {
        echo json_encode(['error' => 'Falta el parámetro user_id']);
    }
} else {
    echo json_encode(['error' => 'Método inválido. Usa POST.']);
}
?>