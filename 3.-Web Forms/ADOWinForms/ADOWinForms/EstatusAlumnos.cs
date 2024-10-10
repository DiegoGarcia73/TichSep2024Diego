using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ADOWinForms.ADO;
using ADOWinForms.Entidades;

namespace ADOWinForms
{
    public partial class Estatus : Form //Partial porque más de una clase la conforma. Estatus hace Herencia de la clase padre FORM 
    {
        public Estatus() //Método constructor: se llama igual que la clase Estatus y no tiene retorno (no requiere argumentos), pero sí se le pueden poner y se invoca cuando se instancia la clasee
        {
            InitializeComponent(); //Inicia la aplicación el componente
        }
        ADOEstatusAlumno _metodos = new ADOEstatusAlumno(); //Creación del  objeto
        EstatusAlumno _estatus = new EstatusAlumno(); //Creación del objeto
        List<EstatusAlumno> _listaEstatus = new List<EstatusAlumno>();
        Enum opcion;

        private void CargarElementos() //Modificador de acceso private solo se accede desde la estructura o clase donde se está definiendo o declarando
                                       //void no retorna
                                       //Se crea el método llamado CargarElementos que no recibe argumentos
        {
            //El objeto métodos se usa para invocar al método Consultar proveniente de la clase AdoEstatusAlumno
            _listaEstatus = _metodos.Consultar().ToList();//El método To List convierte el retorno del método a tipo lista 
            cbEstatus.DataSource = _listaEstatus; //La propiedad Data source permite añadir los valores al control combo box, es decir de la lista que se va a cargar
            cbEstatus.DisplayMember = "nombre"; //La propiedad DisplayMember nos permite definir el valor que se va mostrar en el control combo box
            cbEstatus.ValueMember = "id"; //La propiedad ValueMember es interna nos permite definir el valor que se va obtener como resultado de la selección de una opción dentro del control combobox
            dgvEstatus.DataSource = _listaEstatus;
            

        }  
        private void LimpiarControles()
        {
            txtNombre.Text = " "; //Los va a vaciar, dejará en blanco. Propiedad text es lo que tiene escrito o no
            txtClave.Text = " ";
        }
        private void Botones()
        {
            pnlMostrar.Visible = true; //Visible o no, true sí se ve, en false no
            btnAgregar.Enabled = false; //enabled activo o inactivo
            btnActualizar.Enabled = false;
            btnEliminar.Enabled = false;

        }
        private void EstatusAlumnos_Load(object sender, EventArgs e) //sender hace referencia al objeto que se usa y "e" hace referencia a los argumentos de ese objeto
        {
            CargarElementos();

            pnlMostrar.Visible=false;
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            //Message.Show arroja un mensaje en pantalla
            MessageBox.Show($"Valor seleccionado {cbEstatus.SelectedValue}");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            pnlMostrar.Visible = true;
            opcion = Enum.agregar;
            LimpiarControles();
            Botones();
            
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            pnlMostrar.Visible = false;
            btnAgregar.Enabled = true;
            btnActualizar.Enabled = true;
            btnEliminar.Enabled = true;

            switch (opcion)
            { 
                case Enum.agregar:
                  EstatusAlumno estatus = new EstatusAlumno();
                  estatus.nombre = txtNombre.Text;
                  estatus.clave = txtClave.Text;
                  _metodos.Agregar(estatus);
                  break;

                case Enum.actualizar:
                  EstatusAlumno estatusAlumno = new EstatusAlumno();
                  estatusAlumno.nombre = txtNombre.Text;
                  estatusAlumno.clave = txtClave.Text;
                  break;
            }
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            pnlMostrar.Visible = true;
            opcion = Enum.agregar;
            LimpiarControles();
            Botones();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            pnlMostrar.Visible=false;
            btnAgregar.Enabled = true; //enabled activo o inactivo
            btnActualizar.Enabled = true;
            btnEliminar.Enabled = true;
        }
    }
}
