<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';

$database = new Database();
$db = $database->getConnection();

// Consulta para traer los primeros 20 registros de empleados (paginación simple)
$query = "SELECT * FROM Empleados LIMIT 20";
$stmt = $db->prepare($query);
$stmt->execute();

$empleados = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Lo enviamos como formato JSON para que React lo entienda
echo json_encode($empleados);