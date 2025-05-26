<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL CreateUser(?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['username'], $_POST['email'], $_POST['password'], $_POST['created_by']]);
echo "Usuario creado";
?>