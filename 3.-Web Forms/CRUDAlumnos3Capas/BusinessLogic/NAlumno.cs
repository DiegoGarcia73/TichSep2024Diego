using Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Data;

namespace BusinessLogic
{
    public class NAlumno
    {
        DAlumno _DAlumno = new DAlumno();
        public List<Alumno> Consultar()
        {
            List <Alumno> listaAlumno = _DAlumno.Consultar();
            return listaAlumno;

        }
        public Alumno Consultar(int id)
        {
           Alumno oAlumno = _DAlumno.Consultar(id);
           return oAlumno;
        }
        public void Agregar(Alumno alumno)
        {
            _DAlumno.Agregar(alumno);
        }
        public void Actualizar(Alumno alumno)
        {
            _DAlumno.Actualizar(alumno);
        }
        public void Eliminar(int id)
        {
            _DAlumno.Eliminar(id);
        }
    }
}
 