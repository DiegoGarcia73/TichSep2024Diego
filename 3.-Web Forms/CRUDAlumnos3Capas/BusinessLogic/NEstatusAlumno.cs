using Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
  public class NEstatusAlumno
    {
        DEstatusAlumno _DEstatusAlumno = new DEstatusAlumno();
        public List<EstatusAlumno> Consultar()
        {
            List<EstatusAlumno> olistaEstatus = _DEstatusAlumno.Consultar();
            return olistaEstatus;
        }
    }
}
