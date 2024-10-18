using System;
using System.Collections.Generic;

namespace HolaMundoAPIRest.Models.Entities;

public partial class Estados
{
    public int Id { get; set; }

    public string? Nombre { get; set; }

    public virtual ICollection<Alumnos> Alumnos { get; set; } = new List<Alumnos>();
}
