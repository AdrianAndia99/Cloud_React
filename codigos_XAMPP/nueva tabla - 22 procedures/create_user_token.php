<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL CreateUserToken(?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['userid'], $_POST['token'], $_POST['created_by']]);
echo "Token creado";
?>
