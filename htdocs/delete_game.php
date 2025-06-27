<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL DeleteGame(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id']]);
echo "Juego eliminado";
?>
