<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL ActivarUsuario(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['user_id']]);
echo "Usuario activado";
?>
