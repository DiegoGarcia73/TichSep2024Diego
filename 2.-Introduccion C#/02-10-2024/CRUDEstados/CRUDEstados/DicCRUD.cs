using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDEstados
{
    internal class DicCRUD
    {
        //Creación del diccionario
        private static Dictionary<int, Estado> _DicEstados = new Dictionary<int, Estado>();
        //Creación de los métodos       
        public static Dictionary<int, Estado> ConsultarTodos()
        {
            return _DicEstados;
        }
        public static Estado ConsultarSoloUno(int id)
        {
            return _DicEstados[id];
        }
        public static void Agregar(Estado estado)
        {
            _DicEstados.Add(estado.id, estado);
        }
        public static void Actualizar(Estado estado)
        {
            _DicEstados[estado.id] = estado;
        }
        public static void Eliminar (int id)
        {
            _DicEstados.Remove(id);
        }
    }

}
