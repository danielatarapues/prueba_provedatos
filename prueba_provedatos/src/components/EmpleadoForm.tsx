import { useState, useEffect, useRef } from "react";
import type { Provincia, Empleado } from "../types";
import ImageUpload from "./ImageUpload";
import { empleadoService } from "../services/empleadoService";

const EmpleadoForm = ({
  onVolver,
  empleadoEdit,
}: {
  onVolver: () => void;
  empleadoEdit?: Empleado;
}) => {
  const [tab, setTab] = useState<"personales" | "laborales">("personales");
  const [provincias, setProvincias] = useState<Provincia[]>([]);
  // Si hay empleadoEdit, cargamos su foto
  const [fotoUrl, setFotoUrl] = useState<string | null>(
    empleadoEdit?.foto
      ? `http://localhost/backend-provedatos/${empleadoEdit.foto}`
      : null,
  );

  const [formData, setFormData] = useState<Empleado>(
    empleadoEdit || {
      nombres: "",
      apellidos: "",
      cedula: "",
      email: "",
      id_provincia_nacimiento: "",
      id_provincia_laboral: "",
      fecha_nacimiento: "",
      fecha_ingreso: "",
      cargo: "",
      departamento: "",
      sueldo: 0,
      jornada_parcial: "N",
      observaciones: "",
      estado: "",
      foto: "",
    },
  );

  const [foto, setFoto] = useState<File | null>(null);

  useEffect(() => {
    empleadoService.getProvincias().then(setProvincias);
  }, []);

  const fechaNacimientoRef = useRef<HTMLInputElement>(null);
  const fechaIngresoRef = useRef<HTMLInputElement>(null);

  const guardar = async () => {
    if (!/^[0-9]{10}$/.test(formData.cedula)) {
      return alert("La cédula debe tener exactamente 10 números.");
    }

    try {
      const esEdicion = !!empleadoEdit?.id;
      const result = await empleadoService.crearOActualizar(
        formData,
        foto,
        esEdicion,
      );

      alert(result.message || "Operación realizada con éxito");
      onVolver();
    } catch (error: unknown) {
      console.error("Error capturado:", error);
      const errorMessage =
        error instanceof Error
          ? error.message
          : "Hubo un problema al procesar la solicitud.";
      alert(errorMessage);
    }
  };

  return (
    <div className="container mt-4" style={{ maxWidth: "900px" }}>
      <div className="card border-0 shadow-sm">
        <div
          className="text-center border py-2 bg-white mb-1 fw-light"
          style={{ color: "#666" }}
        >
          Módulo de Empleados
        </div>
        {/* Título dinámico */}
        <div
          className="text-center py-2"
          style={{
            backgroundColor: empleadoEdit ? "#fcf8e3" : "#d9edf7",
            color: empleadoEdit ? "#8a6d3b" : "#31708f",
            fontWeight: "500",
            border: "1px solid #faebcc",
          }}
        >
          {empleadoEdit
            ? `EDITANDO EMPLEADO: ${empleadoEdit.nombres}`
            : "CREAR EMPLEADO NUEVO"}
        </div>

        {/* Tabs */}
        <ul className="nav nav-tabs mt-3 border-bottom-0">
          <li className="nav-item">
            <button
              className={`nav-link ${tab === "personales" ? "active text-primary" : "text-muted"}`}
              onClick={() => setTab("personales")}
            >
              Datos Personales
            </button>
          </li>
          <li className="nav-item">
            <button
              className={`nav-link ${tab === "laborales" ? "active text-primary" : "text-muted"}`}
              onClick={() => setTab("laborales")}
            >
              Datos Laborales
            </button>
          </li>
        </ul>

        <div className="card-body border pt-4 bg-white">
          {tab === "personales" ? (
            <div className="row g-3">
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Nombres
                </label>
                <input
                  type="text"
                  className="form-control form-control-sm"
                  value={formData.nombres}
                  onChange={(e) =>
                    setFormData({ ...formData, nombres: e.target.value })
                  }
                />
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Apellidos
                </label>
                <input
                  type="text"
                  className="form-control form-control-sm"
                  value={formData.apellidos}
                  onChange={(e) =>
                    setFormData({ ...formData, apellidos: e.target.value })
                  }
                />
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Cédula: (Valida)
                </label>
                <input
                  type="text"
                  className="form-control form-control-sm"
                  value={formData.cedula}
                  onChange={(e) =>
                    setFormData({ ...formData, cedula: e.target.value })
                  }
                />
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Provincia (Lugar de Nacimiento)
                </label>
                <select
                  className="form-select form-select-sm text-muted"
                  value={formData.id_provincia_nacimiento}
                  onChange={(e) =>
                    setFormData({
                      ...formData,
                      id_provincia_nacimiento: e.target.value,
                    })
                  }
                >
                  <option value="">Escoja una provincia...</option>
                  {provincias.map((p) => (
                    <option key={p.id_provincia} value={p.id_provincia}>
                      {p.nombre_provincia}
                    </option>
                  ))}
                </select>
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Fecha de Nacimiento
                </label>
                <div className="input-group input-group-sm">
                  <input
                    ref={fechaNacimientoRef}
                    type="date"
                    className="form-control no-native-icon"
                    value={formData.fecha_nacimiento}
                    max={new Date().toISOString().split("T")[0]}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        fecha_nacimiento: e.target.value,
                      })
                    }
                  />
                  <span
                    className="input-group-text bg-secondary text-white border-secondary"
                    style={{ cursor: "pointer" }}
                    onClick={() => fechaNacimientoRef.current?.showPicker()}
                  >
                    <i className="bi bi-calendar3"></i>
                  </span>
                </div>
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Email: (Valida)
                </label>
                <input
                  type="email"
                  className="form-control form-control-sm text-muted"
                  placeholder="correo-personal@email.com"
                  value={formData.email}
                  onChange={(e) =>
                    setFormData({ ...formData, email: e.target.value })
                  }
                />
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Observaciones:
                </label>
                <textarea
                  className="form-control form-control-sm"
                  rows={4}
                  placeholder="Comentario u observación referente a la ficha personal"
                  value={formData.observaciones}
                  onChange={(e) =>
                    setFormData({ ...formData, observaciones: e.target.value })
                  }
                ></textarea>
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Fotografía:
                </label>
                <ImageUpload
                  previewUrl={fotoUrl} // Pasamos la URL actual
                  onChange={(file) => {
                    setFoto(file);
                    if (file) {
                      const url = URL.createObjectURL(file);
                      setFotoUrl(url); // Guardamos la URL en el padre
                    } else {
                      setFotoUrl(null);
                    }
                  }}
                />{" "}
              </div>

              <div className="col-12 d-flex justify-content-center gap-4 mt-4 mb-2">
                <button
                  className="btn btn-success px-5"
                  style={{ backgroundColor: "#5cb85c", borderColor: "#4cae4c" }}
                  onClick={() => setTab("laborales")}
                >
                  Continuar
                </button>
                <button
                  className="btn btn-warning text-white px-5"
                  style={{ backgroundColor: "#f0ad4e", borderColor: "#eea236" }}
                >
                  Reporte
                </button>
                <button
                  className="btn btn-danger px-5"
                  style={{ backgroundColor: "#d9534f", borderColor: "#d43f3a" }}
                  onClick={onVolver}
                >
                  Salir
                </button>
              </div>
            </div>
          ) : (
            <div className="row g-3">
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Fecha de Ingreso
                </label>
                <div className="input-group input-group-sm">
                  <input
                    ref={fechaIngresoRef}
                    type="date"
                    className="form-control no-native-icon"
                    value={formData.fecha_ingreso}
                    min={formData.fecha_nacimiento || undefined}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        fecha_ingreso: e.target.value,
                      })
                    }
                  />
                  <span
                    className="input-group-text bg-secondary text-white border-secondary"
                    style={{ cursor: "pointer" }}
                    onClick={() => fechaIngresoRef.current?.showPicker()}
                  >
                    <i className="bi bi-calendar3"></i>
                  </span>
                </div>
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Cargo
                </label>
                <input
                  type="text"
                  className="form-control form-control-sm"
                  value={formData.cargo}
                  onChange={(e) =>
                    setFormData({ ...formData, cargo: e.target.value })
                  }
                />
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Departamento:
                </label>
                <input
                  type="text"
                  className="form-control form-control-sm"
                  value={formData.departamento}
                  onChange={(e) =>
                    setFormData({ ...formData, departamento: e.target.value })
                  }
                />
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Provincia (Lugar de Trabajo):
                </label>
                <select
                  className="form-select form-select-sm text-muted"
                  value={formData.id_provincia_laboral}
                  onChange={(e) =>
                    setFormData({
                      ...formData,
                      id_provincia_laboral: e.target.value,
                    })
                  }
                >
                  <option value="">Escoja una provincia...</option>
                  {provincias.map((p) => (
                    <option key={p.id_provincia} value={p.id_provincia}>
                      {p.nombre_provincia}
                    </option>
                  ))}
                </select>
              </div>
              <div className="col-md-6">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Sueldo:
                </label>
                <div className="input-group input-group-sm">
                  <input
                    type="number"
                    className="form-control text-end"
                    placeholder="530.00"
                    value={formData.sueldo}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        sueldo: parseFloat(e.target.value) || 0,
                      })
                    }
                  />
                  <span className="input-group-text bg-transparent border-0">
                    USD
                  </span>
                </div>
              </div>
              <div className="col-md-6 text-start">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Jornada Parcial
                </label>
                <div className="form-check form-check-inline">
                  <input
                    className="form-check-input"
                    type="radio"
                    name="jornada"
                    id="si"
                    checked={formData.jornada_parcial === "S"}
                    onChange={() =>
                      setFormData({ ...formData, jornada_parcial: "S" })
                    }
                  />
                  <label className="form-check-label small" htmlFor="si">
                    Sí
                  </label>
                </div>
                <div className="form-check form-check-inline">
                  <input
                    className="form-check-input"
                    type="radio"
                    name="jornada"
                    id="no"
                    checked={formData.jornada_parcial === "N"}
                    onChange={() =>
                      setFormData({ ...formData, jornada_parcial: "N" })
                    }
                  />
                  <label className="form-check-label small" htmlFor="no">
                    No
                  </label>
                </div>
              </div>
              <div className="col-12">
                <label className="form-label fw-bold small text-secondary d-block text-start">
                  Observaciones:
                </label>
                <textarea
                  className="form-control form-control-sm"
                  rows={4}
                  placeholder="Comentario u observación referente a LA FICHA LABORAL"
                  value={formData.observaciones}
                  onChange={(e) =>
                    setFormData({ ...formData, observaciones: e.target.value })
                  }
                ></textarea>
              </div>

              <div className="col-12 d-flex justify-content-center gap-4 mt-4 mb-2">
                <button
                  className="btn btn-success px-5"
                  style={{ backgroundColor: "#5cb85c", borderColor: "#4cae4c" }}
                  onClick={guardar}
                >
                  {empleadoEdit ? "Actualizar" : "Guardar"}
                </button>
                <button
                  className="btn btn-warning text-white px-5"
                  style={{ backgroundColor: "#f0ad4e", borderColor: "#eea236" }}
                >
                  Reporte
                </button>
                <button
                  className="btn btn-danger px-5"
                  style={{ backgroundColor: "#d9534f", borderColor: "#d43f3a" }}
                  onClick={onVolver}
                >
                  Salir
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default EmpleadoForm;
