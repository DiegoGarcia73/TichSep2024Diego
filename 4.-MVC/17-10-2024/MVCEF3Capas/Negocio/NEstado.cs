using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Negocio
{
    public class NEstado
    {
        InstitutoTich _DBContext = new InstitutoTich();

        public List<Estados> Consultar()
        {
            List<Estados> listaEstados = _DBContext.Estados.ToList();
            return listaEstados;
        }
    }
}
