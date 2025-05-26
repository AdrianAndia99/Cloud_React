<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL DeleteLogin(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id']]);
echo "Login eliminado";
?>
