<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL CreateLogin(?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['user_id'], $_POST['ip_address'], $_POST['attempt_count'], $_POST['created_by']]);
echo "Login registrado";
?>
