<?php

$pdo = new PDO('mysql:host=localhost:8889;dbname=api_banque', 'root', 'root');

$statement = $pdo->query("SELECT * FROM user");
$result = $statement->fetchAll();

header("Content-Type:application/json");

echo json_encode($result);
