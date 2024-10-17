using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Entidades
{
    [MetadataType(typeof(AlumnosDataAnnotations))]

    public partial class Alumnos
    {
    }
    public class AlumnosDataAnnotations
    {
        [Key]
        public int id { get; set; }



        [Required(ErrorMessage = "El {0} es obligatorio")]
        [RegularExpression(@"[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+(\s*[a-zA-ZñÑáéíóúÁÉÍÓÚ]*)*[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$", ErrorMessage = "El {0} solo debe contener letras y espacios")]
        public string nombre { get; set; }

        [Display(Name = "primer apellido")]
        [Required(ErrorMessage = "El {0} es obligatorio")]
        [RegularExpression(@"[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+(\s*[a-zA-ZñÑáéíóúÁÉÍÓÚ]*)*[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$", ErrorMessage = "El {0} solo debe contener letras y espacios")]
        public string primerApellido { get; set; }


        [Display(Name = "segundo apellido")]
        [RegularExpression(@"[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+(\s*[a-zA-ZñÑáéíóúÁÉÍÓÚ]*)*[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$", ErrorMessage = "El {0} solo debe contener letras y espacios")]
        public string segundoApellido { get; set; }


        [Required(ErrorMessage = "El {0} es obligatorio")]
        public string correo { get; set; }


        public string telefono { get; set; }


        [Display(Name = "Fecha de nacimiento")]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [RangoFecha("01-01-1990", "31-12-2000", ErrorMessage = "Fecha fuera de rango, la fecha debe estar entre {1} y {2}")]
        [Required(ErrorMessage = "La {0} es obligatoria")]
        public System.DateTime fechaNacimiento { get; set; }


        [Display(Name = "CURP")]
        [Required(ErrorMessage = "El {0} es obligatorio")]
        [RegularExpression(@"^[A-Z]{4}\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])[HM](AS|BS|CL|CS|DF|GT|HG|MC|MS|NL|PL|QR|SL|TC|TL|YN|NE|BC|CC|CM|CH|DG|GR|JC|MN|NT|OC|QT|SP|SR|TS|VZ|ZS)[B-DF-HJ-NP-TV-Z]{3}\d{2}$", ErrorMessage = "El {0} no tiene el fomato correcto")]
        public string curp { get; set; }


        [Display(Name = "Sueldo")]
        [Range(10000, 40000, ErrorMessage = "El sueldo debe estar entre {1} y {2}")]
        public Nullable<decimal> sueldo { get; set; }



        [Display(Name = "Estado")]
        public int idEstadoOrigen { get; set; }


        [Display(Name = "Estatus del alumno")]
        public short idEstatus { get; set; }
    }
}
