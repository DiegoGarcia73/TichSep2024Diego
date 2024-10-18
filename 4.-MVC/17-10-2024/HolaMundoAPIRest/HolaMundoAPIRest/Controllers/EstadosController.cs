using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HolaMundoAPIRest.Models.Context;
using HolaMundoAPIRest.Models.Entities;

namespace HolaMundoAPIRest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadosController : ControllerBase
    {
        private readonly EstadosContext _context;

        public EstadosController(EstadosContext context) //Inyección de dependencias
        {
            _context = context;
        }

        // GET: api/Estados
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Estados>>> GetEstados()
        {
            return await _context.Estados.ToListAsync(); //Devuelve una lista de estados, usando métodos asíncronos, esperar a que termine la tarea para devolver o retornar
        }

        // GET: api/Estados/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Estados>> GetEstados(int id)
        {
            var estados = await _context.Estados.FindAsync(id);

            if (estados == null)
            {
                return NotFound();
            }

            return estados;
        }

        // PUT: api/Estados/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEstados(int id, Estados estados)
        {
            if (id != estados.Id)
            {
                return BadRequest();
            }

            _context.Entry(estados).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EstadosExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Estados
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Estados>> PostEstados(Estados estados)
        {
            _context.Estados.Add(estados);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (EstadosExists(estados.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetEstados", new { id = estados.Id }, estados);
        }

        // DELETE: api/Estados/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEstados(int id)
        {
            var estados = await _context.Estados.FindAsync(id);
            if (estados == null)
            {
                return NotFound();
            }

            _context.Estados.Remove(estados);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EstadosExists(int id)
        {
            return _context.Estados.Any(e => e.Id == id);
        }
    }
}
