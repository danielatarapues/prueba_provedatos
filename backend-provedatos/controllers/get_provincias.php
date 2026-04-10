<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';

$database = new Database();
$db = $database->getConnection();

// Consulta simple para llenar los selects del frontend
$query = "SELECT id_provincia, nombre_provincia FROM Provincia ORDER BY nombre_provincia ASC";
$stmt = $db->prepare($query);
$stmt->execute();

$provincias = $stmt->fetchAll(PDO::FETCH_ASSOC);

http_response_code(200);
echo json_encode($provincias);