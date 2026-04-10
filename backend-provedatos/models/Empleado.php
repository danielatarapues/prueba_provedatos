<?php
class Empleado {
    private $conn;
    private $table_name = "empleados";

    public function __construct($db) {
        $this->conn = $db;
    }

    // Listar primeros 20 registros para la pantalla inicial
    public function readLimit() {
        $query = "SELECT nombres, apellidos, cedula, cargo FROM " . $this->table_name . " LIMIT 20";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Reporte General con ordenamiento y doble JOIN de provincias
    public function readAll($sortColumn = 'apellidos', $sortDir = 'ASC') {
        $allowedColumns = ['nombres', 'apellidos', 'cedula', 'cargo', 'departamento', 'sueldo'];
        $column = in_array($sortColumn, $allowedColumns) ? $sortColumn : 'apellidos';
        $dir = (strtoupper($sortDir) === 'DESC') ? 'DESC' : 'ASC';

        $query = "SELECT e.*, 
                  p1.nombre_provincia AS provincia_nacimiento, 
                  p2.nombre_provincia AS provincia_laboral
                  FROM " . $this->table_name . " e
                  LEFT JOIN provincia p1 ON e.id_provincia_nacimiento = p1.id_provincia
                  LEFT JOIN provincia p2 ON e.id_provincia_laboral = p2.id_provincia
                  ORDER BY $column $dir";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Crear empleado con todos los campos del formulario
    public function create($data) {
        $query = "INSERT INTO " . $this->table_name . " 
                  SET nombres=:nombres, apellidos=:apellidos, cedula=:cedula, email=:email,
                      id_provincia_nacimiento=:id_prov_nac, 
                      id_provincia_laboral=:id_prov_lab, 
                      fecha_nacimiento=:fecha_nac, fecha_ingreso=:fecha_ing, 
                      cargo=:cargo, departamento=:departamento, sueldo=:sueldo, 
                      jornada_parcial=:jornada, observaciones=:obs, foto=:foto";
        
        $stmt = $this->conn->prepare($query);

        // Limpieza de datos
        $stmt->bindParam(":nombres", htmlspecialchars(strip_tags($data->nombres)));
        $stmt->bindParam(":apellidos", htmlspecialchars(strip_tags($data->apellidos)));
        $stmt->bindParam(":cedula", $data->cedula);
        $stmt->bindParam(":email", $data->email);
        $stmt->bindParam(":id_prov_nac", $data->id_provincia_nacimiento);
        $stmt->bindParam(":id_prov_lab", $data->id_provincia_laboral);
        $stmt->bindParam(":fecha_nac", $data->fecha_nacimiento);
        $stmt->bindParam(":fecha_ing", $data->fecha_ingreso);
        $stmt->bindParam(":cargo", htmlspecialchars(strip_tags($data->cargo)));
        $stmt->bindParam(":departamento", htmlspecialchars(strip_tags($data->departamento)));
        $stmt->bindParam(":sueldo", $data->sueldo);
        $stmt->bindParam(":jornada", $data->jornada_parcial);
        $stmt->bindParam(":obs", htmlspecialchars(strip_tags($data->observaciones)));
        $stmt->bindParam(":foto", $data->foto);

        return $stmt->execute();
    }

    public function update($data) {
    $query = "UPDATE " . $this->table_name . " 
              SET nombres=:nombres, apellidos=:apellidos, cedula=:cedula, email=:email,
                  id_provincia_nacimiento=:id_prov_nac, 
                  id_provincia_laboral=:id_prov_lab, 
                  fecha_nacimiento=:fecha_nac, fecha_ingreso=:fecha_ing, 
                  cargo=:cargo, departamento=:departamento, sueldo=:sueldo, 
                  jornada_parcial=:jornada, observaciones=:obs" . 
                  ($data->foto ? ", foto=:foto" : "") . 
              " WHERE id=:id";
    
    $stmt = $this->conn->prepare($query);

    $stmt->bindParam(":nombres", htmlspecialchars(strip_tags($data->nombres)));
    $stmt->bindParam(":apellidos", htmlspecialchars(strip_tags($data->apellidos)));
    $stmt->bindParam(":cedula", $data->cedula);
    $stmt->bindParam(":email", $data->email);
    $stmt->bindParam(":id_prov_nac", $data->id_provincia_nacimiento);
    $stmt->bindParam(":id_prov_lab", $data->id_provincia_laboral);
    $stmt->bindParam(":fecha_nac", $data->fecha_nacimiento);
    $stmt->bindParam(":fecha_ing", $data->fecha_ingreso);
    $stmt->bindParam(":cargo", htmlspecialchars(strip_tags($data->cargo)));
    $stmt->bindParam(":departamento", htmlspecialchars(strip_tags($data->departamento)));
    $stmt->bindParam(":sueldo", $data->sueldo);
    $stmt->bindParam(":jornada", $data->jornada_parcial);
    $stmt->bindParam(":obs", htmlspecialchars(strip_tags($data->observaciones)));
    $stmt->bindParam(":id", $data->id);
    
    if($data->foto) {
        $stmt->bindParam(":foto", $data->foto);
    }

    return $stmt->execute();
}

}
?>