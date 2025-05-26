<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL DeleteUser(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id']]);
echo "Usuario eliminado (lógicamente)";
?>
