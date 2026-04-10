import { useState } from 'react';
import EmpleadoListado from './components/EmpleadoListado';
import EmpleadoForm from './components/EmpleadoForm';
import EmpleadoReporte from './components/EmpleadoReporte';
import type { Empleado } from './types';

function App() {
  const [vista, setVista] = useState<'lista' | 'formulario' | 'reporte'>('lista');
  const [empleadoParaEditar, setEmpleadoParaEditar] = useState<Empleado | undefined>(undefined);

  // Función para cuando das clic en la tabla
  const manejarEditar = (empleado: Empleado) => {
    setEmpleadoParaEditar(empleado);
    setVista('formulario');
  };

  // Función para el botón "Crear"
  const manejarCrearNuevo = () => {
    setEmpleadoParaEditar(undefined);
    setVista('formulario');
  };

  return (
    <div className="min-vh-100 bg-light py-4">
      {vista === 'lista' && (
        <EmpleadoListado 
          onCrear={manejarCrearNuevo} 
          onEditar={manejarEditar} 
          onReporte={() => setVista('reporte')} 
        />
      )}

      {vista === 'formulario' && (
        <EmpleadoForm 
          empleadoEdit={empleadoParaEditar} 
          onVolver={() => setVista('lista')} 
        />
      )}

      {vista === 'reporte' && (
        <EmpleadoReporte onVolver={() => setVista('lista')} />
      )}
    </div>
  );
}

export default App;