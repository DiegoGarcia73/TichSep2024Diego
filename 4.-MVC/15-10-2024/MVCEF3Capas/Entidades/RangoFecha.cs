using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace System.ComponentModel.DataAnnotations
{
    public class RangoFecha: ValidationAttribute
    {
        public RangoFecha(string fechaMinima, string fechaMaxima)
        {
            FechaMinima = DateTime.Parse(fechaMinima);
            FechaMaxima = DateTime.Parse(fechaMaxima);
        }
        public DateTime FechaMinima { get; set; }
        public DateTime FechaMaxima { get; set; }

        public override string FormatErrorMessage(string name)
        {
            return String.Format(ErrorMessage,name,FechaMinima.ToString("dd-MM-yyyy"),FechaMaxima.ToString("dd-MM-yyyy"));
        }
        public override bool IsValid(object value)
        {
            DateTime FechaNac = (DateTime)value;
            return FechaNac>=FechaMinima && FechaNac <= FechaMaxima;
        }

    }
    
}
