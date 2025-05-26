<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL ReadGameScores()";
$stmt = $pdo->query($sql);
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
?>
