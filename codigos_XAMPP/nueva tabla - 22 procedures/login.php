<?php
require 'db_config.php';
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    if (!is_array($data)) {
        echo json_encode(["status" => "fail", "message" => "Error al procesar JSON"]);
        exit;
    }

    if (!isset($data['email']) || !isset($data['password'])) {
        echo json_encode(["status" => "fail", "message" => "Parametros faltantes"]);
        exit;
    }

    $email = $data['email'];
    $password = $data['password'];

    // Llamar al procedure
    $stmt = $pdo->prepare("CALL LoginProcedure(?, ?)");
    $stmt->execute([$email, $password]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $ip = $_SERVER['REMOTE_ADDR'];
        $stmtLogin = $pdo->prepare("INSERT INTO Login (user_id, ip_address) VALUES (?, ?)");
        $stmtLogin->execute([$user['id'], $ip]);
        echo json_encode(["status" => "success", "user" => $user]);
    } else {
        echo json_encode(["status" => "fail", "message" => "Credenciales incorrectas"]);
    }
}
?>