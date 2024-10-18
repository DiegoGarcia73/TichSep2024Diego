using System;
using System.Collections.Generic;

namespace WebAPIEstatusAlumnos.Models.Entities;

public partial class EstatusAlumnos
{
    public short Id { get; set; }

    public string Clave { get; set; } = null!;

    public string Nombre { get; set; } = null!;
}
