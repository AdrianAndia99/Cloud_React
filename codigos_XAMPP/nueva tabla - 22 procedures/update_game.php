<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL UpdateGame(?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id'], $_POST['game_name'], $_POST['modified_by']]);
echo "Juego actualizado";
?>
