<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['username'], $data['email'], $data['password'], $data['created_by'])) {
        $pdo = conectar();
        $sql = "CALL CreateUser(?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            $data['username'],
            $data['email'],
            $data['password'],
            $data['created_by']
        ]);
        echo json_encode(['message' => 'Usuario creado exitosamente']);
    } else {
        echo json_encode(['error' => 'Faltan datos necesarios (username, email, password, created_by)']);
    }
} else {
    echo json_encode(['error' => 'Método inválido. Usa POST.']);
}
?>