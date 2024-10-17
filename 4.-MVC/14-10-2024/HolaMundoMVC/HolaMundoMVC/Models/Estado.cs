using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HolaMundoMVC.Models
{
    public class Estado
    {
        public Estado(int id, string nombre)
        {
            this.id = id;
            this.nombre = nombre;
        }

        public int id {  get; set; }
        public string nombre { get; set; }

    }
}