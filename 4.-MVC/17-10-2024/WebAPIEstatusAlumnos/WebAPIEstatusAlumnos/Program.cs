using Microsoft.EntityFrameworkCore;
using WebAPIEstatusAlumnos.Models.Context;

var builder = WebApplication.CreateBuilder(args);

//Agregar referencia a la cadena de conexión de base de datos
var connectionString = builder.Configuration.GetConnectionString("InstitutoTich");
builder.Services.AddDbContext<EstatusContext>(x => x.UseSqlServer(connectionString));

var MyAllowSpecificOrigins = "_MyAllowsSpecificOrigins";
builder.Services.AddCors(options =>
options.AddPolicy(name: MyAllowSpecificOrigins,
builder => {
builder.WithOrigins("http://localhost:53555").AllowAnyMethod().AllowAnyHeader();
})
);

// Add services to the container.

builder.Services.AddControllers();
var app = builder.Build();
app.UseCors(MyAllowSpecificOrigins);
app.UseAuthorization();
app.MapControllers();
app.Run();
