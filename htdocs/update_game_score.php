<?php
require 'db_config.php';

$pdo = conectar();
$sql = "CALL UpdateGameScore(?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['id'], $_POST['score'], $_POST['modified_by']]);
echo "Puntaje actualizado";
?>
