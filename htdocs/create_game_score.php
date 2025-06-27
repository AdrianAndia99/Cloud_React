<?php
require 'conexion.php';

$pdo = conectar();
$sql = "CALL CreateGameScore(?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['gameid'], $_POST['userID'], $_POST['score'], $_POST['created_by']]);
echo "Puntaje registrado";
?>
