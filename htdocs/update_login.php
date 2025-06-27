<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL UpdateLogin(?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id'], $_POST['ip_address'], $_POST['attempt_count'], $_POST['modified_by']]);
echo "Login actualizado";
?>
