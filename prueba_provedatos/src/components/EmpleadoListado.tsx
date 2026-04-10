import { useEffect, useState } from "react";
import type { Empleado } from "../types";

const EmpleadoListado = ({
  onCrear,
  onEditar,
  onReporte,
}: {
  onCrear: () => void;
  onEditar: (emp: Empleado) => void;
  onReporte: () => void;
}) => {
  const [empleados, setEmpleados] = useState<Empleado[]>([]);
  const [filtroNombre, setFiltroNombre] = useState("");
  const [filtroCodigo, setFiltroCodigo] = useState("");
  const [cargando, setCargando] = useState(false);

  // Función base para cargar (todos o filtrados)
  const cargarEmpleados = async (url: string) => {
    try {
      setCargando(true);
      const resp = await fetch(url);
      if (!resp.ok) throw new Error("Error en la respuesta del servidor");
      const data = await resp.json();
      setEmpleados(data);
    } catch (error) {
      console.error("Error al obtener empleados:", error);
    } finally {
      setCargando(false);
    }
  };

  // Carga inicial
  useEffect(() => {
    cargarEmpleados(
      `http://localhost/backend-provedatos/controllers/get_empleados.php`,
    );
  }, []);

  // Función de búsqueda con parámetros limpios
  const manejarBusqueda = () => {
    const params = new URLSearchParams({
      nombre: filtroNombre.trim(),
      codigo: filtroCodigo.trim(),
    }).toString();

    cargarEmpleados(
      `http://localhost/backend-provedatos/controllers/search_empleados.php?${params}`,
    );
  };

  // Función para resetear la búsqueda
  const limpiarFiltros = () => {
    setFiltroNombre("");
    setFiltroCodigo("");
    cargarEmpleados(
      `http://localhost/backend-provedatos/controllers/get_empleados.php`,
    );
  };

  // Ejecutar búsqueda al presionar Enter
  const manejarKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter") {
      manejarBusqueda();
    }
  };

  return (
    <div className="container mt-4">
      <style>{`
        .table-custom-hover tbody tr:hover td {
          background-color: #ffa500 !important;
          color: white !important;
        }
      `}</style>
      <div className="card shadow-sm">
        <div className="card-header bg-light text-center py-3">
          <h4 className="mb-0 text-secondary">Módulo de Empleados</h4>
        </div>
        <div className="card-body">
          {/* Sección de Filtros */}
          <div className="row mb-4 align-items-end">
            <div className="col-md-4">
              <label className="form-label fw-bold">Nombre</label>
              <input
                type="text"
                className="form-control"
                placeholder="Ej: Juan Pérez"
                value={filtroNombre}
                onChange={(e) => setFiltroNombre(e.target.value)}
                onKeyDown={manejarKeyDown}
              />
            </div>
            <div className="col-md-3">
              <label className="form-label fw-bold">Código Empleado</label>
              <input
                type="text"
                className="form-control"
                placeholder="Ej: 00123"
                value={filtroCodigo}
                onChange={(e) => setFiltroCodigo(e.target.value)}
                onKeyDown={manejarKeyDown}
              />
            </div>
            <div className="col-md-5 d-flex gap-2">
              <button
                className="btn btn-primary flex-grow-1 fw-bold"
                onClick={manejarBusqueda}
                disabled={cargando}
              >
                {cargando ? "BUSCANDO..." : "BUSCAR"}
              </button>
              <button
                className="btn btn-outline-secondary"
                onClick={limpiarFiltros}
                title="Limpiar filtros"
              >
                ↻
              </button>
            </div>
          </div>

          {/* Tabla de Resultados */}
          <div className="table-responsive">
            <table className="table table-hover table-striped table-bordered table-custom-hover">
              {" "}
              <thead className="table-light">
                <tr>
                  <th>Nombre Completo</th>
                  <th style={{ width: "150px" }}>Código</th>
                  <th style={{ width: "150px" }}>Estado</th>
                </tr>
              </thead>
              <tbody>
                {empleados.length > 0 ? (
                  empleados.map((emp) => (
                    <tr
                      key={emp.id}
                      onClick={() => onEditar(emp)}
                      style={{ cursor: "pointer" }}
                      title="Haga clic para editar"
                    >
                      <td>{`${emp.apellidos} ${emp.nombres}`}</td>
                      <td className="font-monospace">
                        {emp.id?.toString().padStart(5, "0")}
                      </td>
                      <td>{emp.estado || "1 VIGENTE"}</td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan={3} className="text-center py-4 text-muted">
                      No se encontraron empleados con esos criterios.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>

          <p className="small text-muted">
            Únicamente se están desplegando los primeros 20 registros, si no
            encuentra la información deseada por favor utilice los filtro de la
            parte superiror
          </p>

          {/* Acciones Finales */}
          <div className="d-flex justify-content-center gap-2 mt-4">
            <button className="btn btn-success px-4" onClick={onCrear}>
              Crear Nuevo
            </button>
            <button
              className="btn btn-warning px-4 text-white"
              onClick={onReporte}
            >
              Generar Reporte
            </button>
            <button className="btn btn-danger px-4">Salir</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default EmpleadoListado;
