<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL DeleteGameScore(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id']]);
echo "Puntaje eliminado";
?>
