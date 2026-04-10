import type { Empleado } from "../types";

const API_URL = "http://localhost/backend-provedatos/controllers"; 

export const empleadoService = {
  async getProvincias() {
    try {
      const res = await fetch(`${API_URL}/get_provincias.php`);
      if (!res.ok) throw new Error("Error al obtener provincias");
      return res.json();
    } catch (error) {
      console.error(error);
      return [];
    }
  },

  async crearEmpleado(empleadoData: Empleado, foto: File | null) {
    const data = new FormData();

    // Mapeo manual para asegurar consistencia con el backend
    Object.entries(empleadoData).forEach(([key, value]) => {
      data.append(key, value !== null ? String(value) : "");
    });

    if (foto) {
      data.append("foto", foto); 
    }

    const resp = await fetch(`${API_URL}/create_empleado.php`, {
      method: "POST",
      body: data,
    });

    if (!resp.ok) {
      const errorText = await resp.text();
      throw new Error(errorText || "Error en el servidor");
    }

    return resp.json();
  },

  async actualizarEmpleado(empleadoData: Empleado, foto: File | null) {
    const data = new FormData();
    Object.entries(empleadoData).forEach(([key, value]) => {
      data.append(key, value !== null ? String(value) : "");
    });
    if (foto) data.append("foto", foto);

    const resp = await fetch(`${API_URL}/update_empleado.php`, {
      method: "POST", 
      body: data,
    });
    return resp.json();
  },

  async crearOActualizar(empleadoData: Empleado, foto: File | null, esEdicion: boolean) {
  const data = new FormData();
  Object.entries(empleadoData).forEach(([key, value]) => {
    data.append(key, value !== null ? String(value) : "");
  });

  if (foto) data.append("foto", foto);

  const endpoint = esEdicion ? "update_empleado.php" : "create_empleado.php";

  const resp = await fetch(`${API_URL}/${endpoint}`, {
    method: "POST",
    body: data,
  });

  // Si el servidor responde con error (400, 500, etc)
  if (!resp.ok) {
    const errorData = await resp.json().catch(() => ({ message: "Error desconocido" }));
    throw new Error(errorData.message || "Error en el servidor");
  }

  return resp.json();
}

};
