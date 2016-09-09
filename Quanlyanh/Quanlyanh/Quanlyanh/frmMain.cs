using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;


namespace Quanlyanh
{
    public partial class frmMain : Form
    {
        

        public frmMain()
        {
            InitializeComponent();
        }

        

        private void frmMain_Load(object sender, EventArgs e)
        {
            
        }
        

        private void btnDSthanhvien_Click(object sender, EventArgs e)
        {
            frmDanhsachthanhvien fr = new frmDanhsachthanhvien();
            fr.ShowDialog();

        }

       

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void btnThuvienanh_Click(object sender, EventArgs e)
        {
            frmThuvienanh tv = new frmThuvienanh();
            tv.ShowDialog();
        }

        private void báoCáoThànhViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmRptThanhvien bc = new FrmRptThanhvien();
            bc.ShowDialog();
        }

        private void thôngTinToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmThongtin tt = new FrmThongtin();
            tt.ShowDialog();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void tsmThemthanhvien_Click(object sender, EventArgs e)
        {
            frmThemthanhvien tv = new frmThemthanhvien();
            tv.ShowDialog();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult t = MessageBox.Show("Bạn có thực sự muốn thoát ?", "Thongbao", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (t == DialogResult.Yes)
                Application.Exit();
        }
    }
}
