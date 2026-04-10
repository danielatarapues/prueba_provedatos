import { useEffect, useState } from "react";
import type { Empleado } from "../types";

const EmpleadoReporte = ({ onVolver }: { onVolver: () => void }) => {
  const [data, setData] = useState<Empleado[]>([]);
  const [sort, setSort] = useState({ col: "apellidos", dir: "ASC" });

  const fetchReporte = async (columna: string, direction?: string) => {
    const nuevaDir =
      direction ||
      (sort.col === columna && sort.dir === "ASC" ? "DESC" : "ASC");
    setSort({ col: columna, dir: nuevaDir });

    const resp = await fetch(
      `http://localhost/backend-provedatos/controllers/get_reporte.php?sort=${columna}&dir=${nuevaDir}`,
    );
    const result = await resp.json();
    setData(result);
  };

  useEffect(() => {
    const loadInitialData = async () => {
      const resp = await fetch(
        `http://localhost/backend-provedatos/controllers/get_reporte.php?sort=apellidos&dir=ASC`,
      );
      const result = await resp.json();
      setData(result);
    };
    loadInitialData();
  }, []);

  return (
    <div className="container-fluid mt-4">
      <div className="card shadow">
        <div className="card-header bg-primary text-white d-flex justify-content-between align-items-center">
          <h4 className="mb-0">REPORTE EMPLEADO</h4>
          <button className="btn btn-light btn-sm" onClick={onVolver}>
            Cerrar Reporte
          </button>
        </div>
        <div className="table-responsive" style={{ maxHeight: "70vh" }}>
          <table className="table table-sm table-hover table-bordered small text-nowrap">
            <thead>
              <tr className="table-dark text-uppercase">
                <th
                  onClick={() => fetchReporte("apellidos")}
                  style={{ cursor: "pointer" }}
                >
                  Nombre ↑↓
                </th>
                <th>Cédula</th>
                <th>Email</th>
                <th>Cargo</th>
                <th>Departamento</th>
                <th>Fecha de Ingreso</th>
                <th>Status</th>
                <th>Sueldo</th>
                <th>Provincia</th>
              </tr>
            </thead>
            <tbody>
              {data.map((emp, i) => (
                <tr key={i}>
                  <td>{`${emp.apellidos} ${emp.nombres}`}</td>
                  <td>{emp.cedula}</td>
                  <td>{emp.email}</td>
                  <td>{emp.cargo}</td>
                  <td>{emp.departamento}</td>
                  <td className="text-center">{emp.fecha_ingreso}</td>
                  <td>
                    <span
                      className={`badge ${emp.estado?.includes("VIGENTE") ? "bg-success" : "bg-secondary"}`}
                    >
                      {emp.estado || "1 VIGENTE"}
                    </span>
                  </td>
                  <td className="text-end">{emp.sueldo_display}</td>

                  <td>{emp.provincia_laboral}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="card-footer bg-white text-muted italic">
          El reporte puede ser ordenado haciendo click en las cabeceras.
        </div>
      </div>
    </div>
  );
};

export default EmpleadoReporte;
