<?php

header("Content-type: application/json");
$results = [];

$dbname = "hetic_cours_2";
$host = "127.0.0.1";
$dbuser = "root";
$dbpwd = "root";
$port = 3309;

$dsn = \sprintf(
    "mysql:host=%s;port=%d;dbname=%s",
    $host,
    $port,
    $dbname
);

try {
    $pdo = new \PDO($dsn, $dbuser, $dbpwd);
    $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(\PDO::ATTR_DEFAULT_FETCH_MODE, \PDO::FETCH_ASSOC);
} catch (\PDOException $e) {
    die($e->getMessage());
}

$query = "SELECT `u`.`name`, `u`.`password` FROM `user` u;";
$stmt = $pdo->prepare($query);
$stmt->execute();

while ($row = $stmt->fetch()) {
    $results[] = $row;
}

echo \json_encode($results);
