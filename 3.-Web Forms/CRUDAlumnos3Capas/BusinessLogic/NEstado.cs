using Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class NEstado
    {
        DEstado _DEstado = new DEstado();
        public List<Estado> Consultar()
        {
            List <Estado> olistaEstado = _DEstado.Consultar();
            return olistaEstado;
            
        }
    }
}
