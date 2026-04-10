<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/Database.php';
include_once '../models/Empleado.php';

$database = new Database();
$db = $database->getConnection();
$empleado = new Empleado($db);

// Iniciamos buffer para evitar espacios en blanco accidentales
ob_start();

if(!empty($_POST['id']) && !empty($_POST['nombres'])) {
    
    $foto_ruta = null;
    if(isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = "../uploads/";
        if (!file_exists($upload_dir)) { mkdir($upload_dir, 0777, true); }

        $file_ext = pathinfo($_FILES["foto"]["name"], PATHINFO_EXTENSION);
        $file_name = $_POST['cedula'] . "_edit_" . time() . "." . $file_ext;
        $target_file = $upload_dir . $file_name;

        if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_file)) {
            $foto_ruta = "uploads/" . $file_name;
        }
    }

    $data = new stdClass();
    $data->id = $_POST['id'];
    $data->nombres = $_POST['nombres'];
    $data->apellidos = $_POST['apellidos'];
    $data->cedula = $_POST['cedula'];
    $data->email = $_POST['email'];
    $data->id_provincia_nacimiento = $_POST['id_provincia_nacimiento'];
    $data->id_provincia_laboral = $_POST['id_provincia_laboral'];
    $data->fecha_nacimiento = $_POST['fecha_nacimiento'];
    $data->fecha_ingreso = $_POST['fecha_ingreso'];
    $data->cargo = $_POST['cargo'];
    $data->departamento = $_POST['departamento'];
    $data->sueldo = $_POST['sueldo'];
    $data->jornada_parcial = $_POST['jornada_parcial'];
    $data->observaciones = $_POST['observaciones'];
    $data->foto = $foto_ruta;

    // Ejecutamos la actualización
    $resultado = $empleado->update($data);

    // Limpiamos cualquier warning previo
    if (ob_get_length()) ob_clean();

    if($resultado) {
        http_response_code(200);
        echo json_encode(["message" => "Empleado actualizado con éxito", "success" => true]);
    } else {
        http_response_code(503);
        echo json_encode(["message" => "No se pudo actualizar el empleado o no hubo cambios"]);
    }
} else {
    if (ob_get_length()) ob_clean();
    http_response_code(400);
    echo json_encode(["message" => "Datos incompletos"]);
}
exit;