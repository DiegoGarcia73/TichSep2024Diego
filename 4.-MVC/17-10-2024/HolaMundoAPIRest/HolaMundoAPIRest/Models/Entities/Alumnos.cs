using System;
using System.Collections.Generic;

namespace HolaMundoAPIRest.Models.Entities;

public partial class Alumnos
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string PrimerApellido { get; set; } = null!;

    public string? SegundoApellido { get; set; }

    public string Correo { get; set; } = null!;

    public string Telefono { get; set; } = null!;

    public DateOnly FechaNacimiento { get; set; }

    public string Curp { get; set; } = null!;

    public decimal? Sueldo { get; set; }

    public int IdEstadoOrigen { get; set; }

    public short IdEstatus { get; set; }

    public virtual Estados IdEstadoOrigenNavigation { get; set; } = null!;
}
