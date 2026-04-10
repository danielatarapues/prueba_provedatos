<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';

$database = new Database();
$db = $database->getConnection();

// Limpiamos los espacios en blanco de los parámetros
$nombre = isset($_GET['nombre']) ? trim($_GET['nombre']) : '';
$codigo = isset($_GET['codigo']) ? trim($_GET['codigo']) : '';

// Construcción dinámica simple para evitar conflictos de AND vacíos
$query = "SELECT * FROM Empleados WHERE 1=1";

if ($nombre !== '') {
    $query .= " AND (nombres LIKE :nombre OR apellidos LIKE :nombre)";
}
if ($codigo !== '') {
    $query .= " AND id LIKE :codigo";
}

$query .= " LIMIT 20";

$stmt = $db->prepare($query);

if ($nombre !== '') {
    $busquedaNombre = "%$nombre%";
    $stmt->bindParam(':nombre', $busquedaNombre);
}
if ($codigo !== '') {
    $busquedaCodigo = "%$codigo%";
    $stmt->bindParam(':codigo', $busquedaCodigo);
}

$stmt->execute();
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));