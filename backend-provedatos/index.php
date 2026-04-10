<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

echo json_encode([
    "proyecto" => "PROVEDATOS API",
    "estado" => "En ejecución",
    "mensaje" => "Bienvenido al Challenge de Programación. Use los endpoints en la carpeta /controllers/",
    "endpoints_disponibles" => [
        "GET" => ["get_provincias.php", "get_empleados.php", "get_reporte.php", "search_empleados.php"],
        "POST" => ["create_empleado.php"]
    ]
]);