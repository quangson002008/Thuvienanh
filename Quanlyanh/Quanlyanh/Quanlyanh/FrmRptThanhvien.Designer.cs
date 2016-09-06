namespace Quanlyanh
{
    partial class FrmRptThanhvien
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
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.ThanhvienBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.Thanhvien = new Quanlyanh.Thanhvien();
            ((System.ComponentModel.ISupportInitialize)(this.ThanhvienBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Thanhvien)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.ThanhvienBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "Quanlyanh.rptThanhvien.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(12, 40);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.Size = new System.Drawing.Size(678, 422);
            this.reportViewer1.TabIndex = 0;
            // 
            // ThanhvienBindingSource
            // 
            this.ThanhvienBindingSource.DataMember = "Thanhvien";
            this.ThanhvienBindingSource.DataSource = this.Thanhvien;
            // 
            // Thanhvien
            // 
            this.Thanhvien.DataSetName = "Thanhvien";
            this.Thanhvien.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // FrmRptThanhvien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(696, 499);
            this.Controls.Add(this.reportViewer1);
            this.Name = "FrmRptThanhvien";
            this.Text = "FrmRptThanhvien";
            this.Load += new System.EventHandler(this.FrmRptThanhvien_Load);
            ((System.ComponentModel.ISupportInitialize)(this.ThanhvienBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Thanhvien)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource ThanhvienBindingSource;
        private Thanhvien Thanhvien;
    }
}