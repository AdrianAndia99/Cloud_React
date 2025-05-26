<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL UpdateUserToken(?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id'], $_POST['token'], $_POST['login_attempts'], $_POST['modified_by']]);
echo "Token actualizado";
?>
