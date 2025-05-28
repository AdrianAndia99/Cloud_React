<?php
require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Leer el JSON
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['user_id'])) {
        $pdo = conectar();
        $sql = "CALL ActivarUsuario(?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$data['user_id']]);
        echo "Usuario activado";
    } else {
        echo "Falta el parámetro 'user_id'";
    }
} else {
    echo "Método inválido. Usa POST.";
}