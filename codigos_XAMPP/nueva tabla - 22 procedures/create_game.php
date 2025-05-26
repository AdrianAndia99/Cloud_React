<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL CreateGame(?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['game_name'], $_POST['created_by']]);
echo "Juego creado";
?>
