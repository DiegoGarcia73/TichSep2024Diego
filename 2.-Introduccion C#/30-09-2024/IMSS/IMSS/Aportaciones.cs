using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSS
{
    public struct Aportaciones
    {
        public Aportaciones(decimal enfermedadMaternidad, decimal invalidezVida, decimal retiro, decimal cesantia, decimal infonavit)
        {
            this.enfermedadMaternidad = enfermedadMaternidad;
            this.invalidezVida = invalidezVida;
            this.retiro = retiro;
            this.cesantia = cesantia;
            this.infonavit = infonavit;
        }

        public decimal enfermedadMaternidad { get; set; }
        public decimal invalidezVida { get; set; }
        public decimal retiro { get; set; }
        public decimal cesantia { get; set; }
        public decimal infonavit { get; set; }

    }
}