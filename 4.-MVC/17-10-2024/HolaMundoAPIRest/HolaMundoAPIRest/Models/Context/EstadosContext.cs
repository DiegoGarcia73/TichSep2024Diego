using System;
using System.Collections.Generic;
using HolaMundoAPIRest.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace HolaMundoAPIRest.Models.Context;

public partial class EstadosContext : DbContext
{
    public EstadosContext()
    {
    }

    public EstadosContext(DbContextOptions<EstadosContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Alumnos> Alumnos { get; set; }

    public virtual DbSet<Estados> Estados { get; set; }

    

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Alumnos>(entity =>
        {
            entity.ToTable(tb => tb.HasTrigger("Trigger_EliminarAlumnos"));

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Correo)
                .HasMaxLength(80)
                .IsUnicode(false)
                .HasColumnName("correo");
            entity.Property(e => e.Curp)
                .HasMaxLength(18)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("curp");
            entity.Property(e => e.FechaNacimiento).HasColumnName("fechaNacimiento");
            entity.Property(e => e.IdEstadoOrigen).HasColumnName("idEstadoOrigen");
            entity.Property(e => e.IdEstatus).HasColumnName("idEstatus");
            entity.Property(e => e.Nombre)
                .HasMaxLength(60)
                .IsUnicode(false)
                .HasColumnName("nombre");
            entity.Property(e => e.PrimerApellido)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("primerApellido");
            entity.Property(e => e.SegundoApellido)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("segundoApellido");
            entity.Property(e => e.Sueldo)
                .HasColumnType("decimal(9, 2)")
                .HasColumnName("sueldo");
            entity.Property(e => e.Telefono)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("telefono");

            entity.HasOne(d => d.IdEstadoOrigenNavigation).WithMany(p => p.Alumnos)
                .HasForeignKey(d => d.IdEstadoOrigen)
                .HasConstraintName("FK_Alumnos_Estados");
        });

        modelBuilder.Entity<Estados>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("nombre");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
