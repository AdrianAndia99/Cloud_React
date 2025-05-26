<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL LoginProcedure(?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['email'], $_POST['password']]);
echo json_encode($stmt->fetch(PDO::FETCH_ASSOC));
?>
