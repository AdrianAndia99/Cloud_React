<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL DeleteUserToken(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id']]);
echo "Token eliminado";
?>
