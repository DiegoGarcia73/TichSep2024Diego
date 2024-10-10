using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace HolaMundoWindowsForm
{
    internal class CRUDEstado
    {
        List<Estado> _listaEstados = new List<Estado> //Crear lista de tipo estado
        {
            new Estado {id = 1, nombre = "Aguascalientes"},
            new Estado {id = 2, nombre = "BajaCalifornia"},
            new Estado {id = 3, nombre = "BajaCalifornia Sur"},
            new Estado {id = 4, nombre = "Campeche"},
        };
        public List<Estado> Consultar() //Sobrecarga de métodos
        {
            return _listaEstados;
        }
        public Estado Consultar (int id)
        {
            return _listaEstados.Find(x => x.id == id);
        }
    }
}
