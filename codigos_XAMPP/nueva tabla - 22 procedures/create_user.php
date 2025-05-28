<?php
require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Leer y decodificar JSON desde el body
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
        echo "Usuario creado exitosamente";
    } else {
        echo "Faltan datos necesarios (username, email, password, created_by)";
    }
} else {
    echo "Método inválido. Usa POST.";
}
?>
