using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Negocio
{
    public class NEstatus
    {
        InstitutoTich _DBContext = new InstitutoTich();
        public List<EstatusAlumnos> Consultar()
        {
            List<EstatusAlumnos> listaEstatus = _DBContext.EstatusAlumnos.ToList();
            return listaEstatus;
        }
    }
}
