<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';
include_once '../models/Empleado.php';

$database = new Database();
$db = $database->getConnection();
$empleado = new Empleado($db);

// Capturar parámetros de ordenamiento del frontend
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'apellidos';
$dir = isset($_GET['dir']) ? $_GET['dir'] : 'ASC';

$stmt = $empleado->readAll($sort, $dir);
$num = $stmt->rowCount();

if($num > 0) {
    $empleados_arr = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // Formateo según el requerimiento del PDF (Págs. 3 y 6) [cite: 49, 95]
        $row['sueldo_display'] = number_format($row['sueldo'], 2) . " USD";
        $row['nombre_completo'] = $row['apellidos'] . " " . $row['nombres'];
        array_push($empleados_arr, $row);
    }
    echo json_encode($empleados_arr);
} else {
    echo json_encode([]);
}