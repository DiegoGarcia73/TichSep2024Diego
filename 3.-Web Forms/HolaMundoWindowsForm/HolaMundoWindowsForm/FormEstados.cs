using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HolaMundoWindowsForm
{
    public partial class FormEstados : Form
    {
        public FormEstados()
        {
            InitializeComponent();
        }
        CRUDEstado _oCrudEstado = new CRUDEstado(); //instancia de un objeto tipo oCrudEstado
        private void FormEstados_Load(object sender, EventArgs e) //Se carga antes que todos los elementos visuales

        {
            List<Estado>listaEstados = _oCrudEstado.Consultar(); //retorna una lista y se almacena en una variable
            cbEstados.DataSource= listaEstados; //este control utiliza para obtener sus elementos
            cbEstados.DisplayMember = "nombre"; //lo que se muestra los ekementos de este control
            cbEstados.ValueMember = "id";
            dgvEstados.DataSource= listaEstados; 

            //SE SELECCIONA TODO EL OBJETO
            //Estado oEstado = (Estado)cbEstados.SelectedItem; //OBJETO TIPO ESTADO CONVERSION EXPLICITA ()
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            //int id = Convert.ToInt16(cbEstados.SelectedValue); // Seleccionamos el id
            //Estado oEstado = _oCrudEstado.Consultar(id); //CREAR VARIABLE DE TIPO ESTADO PARA OBTENER OBJETO
            //txtId.Text = oEstado.id.ToString(); //PROPIEDAD ID ASIGNA
            //txtNombre.Text = oEstado.nombre; //PROPIEDAD NOMBRE ASIGNA

            Estado oEstado = (Estado)cbEstados.SelectedItem; //CREAR VARIABLE DE TIPO ESTADO PARA OBTENER OBJETO
            txtId.Text = oEstado.id.ToString(); //PROPIEDAD ID ASIGNA
            txtNombre.Text = oEstado.nombre; //PROPIEDAD NOMBRE ASIGNA
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            pnlEstados.Visible = cbxDetalles.Checked; //visible obtiene un true o false
        }

        private void dgvEstados_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            MessageBox.Show($"Hicieron clic Renglon: {e.RowIndex} Columna: {e.ColumnIndex}");
        }

        private void cbEstados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
