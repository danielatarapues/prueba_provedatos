export interface Provincia {
  id_provincia: number;
  nombre_provincia: string;
}

export interface Empleado {
  nombres: string;
  apellidos: string;
  cedula: string;
  email: string;
  id_provincia_nacimiento: string; // Pestaña 1
  id_provincia_laboral: string; // Pestaña 2
  fecha_nacimiento: string;
  fecha_ingreso: string;
  cargo: string;
  departamento: string;
  sueldo: number;
  jornada_parcial: "S" | "N";
  observaciones: string;
  estado: string;
  id?: number; // Solo para edición, no es obligatorio en creación
  foto: string;
  nombre_provincia?: string; // Para mostrar el nombre de la provincia en el reporte, no es parte del formulario de creación/edición
  provincia_laboral?: string; // Para mostrar el nombre de la provincia laboral en el reporte, no es parte del formulario de creación/edición
  sueldo_formateado?: string; // Para mostrar el sueldo formateado en el reporte, no es parte del formulario de creación/edición
  sueldo_display?: string; // Para mostrar el sueldo formateado en el reporte, no es parte del formulario de creación/edición
}
