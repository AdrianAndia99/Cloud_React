<?php
require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    if (!is_array($data)) {
        echo json_encode(["status" => "fail", "message" => "Error al procesar JSON"]);
        exit;
    }

    if (!isset($data['username']) || !isset($data['password'])) {
        echo json_encode(["status" => "fail", "message" => "Parametros faltantes"]);
        exit;
    }

    $username = $data['username'];
    $password = $data['password'];

    $stmt = $pdo->prepare("SELECT id, password FROM User WHERE username = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Comparación directa (sin hash)
    if ($user && $password === $user['password']) {
        $ip = $_SERVER['REMOTE_ADDR'];
        $stmtLogin = $pdo->prepare("INSERT INTO Login (user_id, ip_address) VALUES (?, ?)");
        $stmtLogin->execute([$user['id'], $ip]);
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "fail", "message" => "Credenciales incorrectas"]);
    }
}
?>