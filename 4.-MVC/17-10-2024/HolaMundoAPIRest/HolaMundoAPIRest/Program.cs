using HolaMundoAPIRest.Models.Context;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

//Agregar referencia a la cadena de conexión de base de datos
var connectionString = builder.Configuration.GetConnectionString("InstitutoTich"); //Nombre de la cadena de conexión de appsettings InstitutoTich
builder.Services.AddDbContext<EstadosContext>(x=> x.UseSqlServer(connectionString));

var MyAllowSpecificOrigins = "_MyAllowSpecificOrigins"; //nombre del objeto que se esta creando
builder.Services.AddCors(options => 
options.AddPolicy(name: MyAllowSpecificOrigins, 
builder => {
    builder.WithOrigins("http://localhost:53555/").AllowAnyMethod().AllowAnyHeader();
    })
);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
