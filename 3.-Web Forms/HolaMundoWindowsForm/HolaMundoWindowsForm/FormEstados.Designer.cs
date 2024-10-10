namespace HolaMundoWindowsForm
{
    partial class FormEstados
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cbEstados = new System.Windows.Forms.ComboBox();
            this.idEstados = new System.Windows.Forms.Label();
            this.dgvEstados = new System.Windows.Forms.DataGridView();
            this.pnlEstados = new System.Windows.Forms.Panel();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.txtId = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.lblid = new System.Windows.Forms.Label();
            this.btnConsultar = new System.Windows.Forms.Button();
            this.cbxDetalles = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEstados)).BeginInit();
            this.pnlEstados.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbEstados
            // 
            this.cbEstados.FormattingEnabled = true;
            this.cbEstados.Location = new System.Drawing.Point(200, 47);
            this.cbEstados.Name = "cbEstados";
            this.cbEstados.Size = new System.Drawing.Size(121, 24);
            this.cbEstados.TabIndex = 0;
            this.cbEstados.SelectedIndexChanged += new System.EventHandler(this.cbEstados_SelectedIndexChanged);
            // 
            // idEstados
            // 
            this.idEstados.AutoSize = true;
            this.idEstados.Location = new System.Drawing.Point(100, 50);
            this.idEstados.Name = "idEstados";
            this.idEstados.Size = new System.Drawing.Size(57, 16);
            this.idEstados.TabIndex = 1;
            this.idEstados.Text = "Estados";
            // 
            // dgvEstados
            // 
            this.dgvEstados.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvEstados.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEstados.Location = new System.Drawing.Point(91, 87);
            this.dgvEstados.Name = "dgvEstados";
            this.dgvEstados.RowHeadersWidth = 51;
            this.dgvEstados.RowTemplate.Height = 24;
            this.dgvEstados.Size = new System.Drawing.Size(879, 150);
            this.dgvEstados.TabIndex = 2;
            this.dgvEstados.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvEstados_CellClick);
            // 
            // pnlEstados
            // 
            this.pnlEstados.Controls.Add(this.txtNombre);
            this.pnlEstados.Controls.Add(this.txtId);
            this.pnlEstados.Controls.Add(this.lblNombre);
            this.pnlEstados.Controls.Add(this.lblid);
            this.pnlEstados.Location = new System.Drawing.Point(91, 308);
            this.pnlEstados.Name = "pnlEstados";
            this.pnlEstados.Size = new System.Drawing.Size(293, 174);
            this.pnlEstados.TabIndex = 3;
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(93, 54);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(100, 22);
            this.txtNombre.TabIndex = 5;
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(93, 20);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 22);
            this.txtId.TabIndex = 5;
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(27, 54);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(53, 16);
            this.lblNombre.TabIndex = 5;
            this.lblNombre.Text = "nombre";
            // 
            // lblid
            // 
            this.lblid.AutoSize = true;
            this.lblid.Location = new System.Drawing.Point(27, 23);
            this.lblid.Name = "lblid";
            this.lblid.Size = new System.Drawing.Size(18, 16);
            this.lblid.TabIndex = 5;
            this.lblid.Text = "id";
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(493, 260);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(75, 23);
            this.btnConsultar.TabIndex = 4;
            this.btnConsultar.Text = "Consultar";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // cbxDetalles
            // 
            this.cbxDetalles.AutoSize = true;
            this.cbxDetalles.Location = new System.Drawing.Point(716, 29);
            this.cbxDetalles.Name = "cbxDetalles";
            this.cbxDetalles.Size = new System.Drawing.Size(109, 20);
            this.cbxDetalles.TabIndex = 5;
            this.cbxDetalles.Text = "Mostrar Panel";
            this.cbxDetalles.UseVisualStyleBackColor = true;
            this.cbxDetalles.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // FormEstados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.cbxDetalles);
            this.Controls.Add(this.btnConsultar);
            this.Controls.Add(this.pnlEstados);
            this.Controls.Add(this.dgvEstados);
            this.Controls.Add(this.idEstados);
            this.Controls.Add(this.cbEstados);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FormEstados";
            this.Text = "FormEstados";
            this.Load += new System.EventHandler(this.FormEstados_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvEstados)).EndInit();
            this.pnlEstados.ResumeLayout(false);
            this.pnlEstados.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbEstados;
        private System.Windows.Forms.Label idEstados;
        private System.Windows.Forms.DataGridView dgvEstados;
        private System.Windows.Forms.Panel pnlEstados;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Label lblid;
        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.CheckBox cbxDetalles;
    }
}