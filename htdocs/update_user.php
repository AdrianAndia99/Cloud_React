<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL UpdateUser(?, ?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id'], $_POST['username'], $_POST['email'], $_POST['password'], $_POST['modified_by']]);
echo "Usuario actualizado";
?>