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
    public partial class frmAlbum : Form
    {
        string cnstr;
        SqlConnection cn;
        DataTable dt;
        public frmAlbum()
        {
            InitializeComponent();
        }

        private void frmAlbum_Load(object sender, EventArgs e)
        {
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
            cn = new SqlConnection(cnstr);
            dataGridView1.DataSource = getalbum();
            txtMaalbum.DataBindings.Add("Text", dt, "Maalbum");
            txtTenalbum.DataBindings.Add("Text", dt, "Tenalbum");

          
        }
        private DataTable getalbum()
        {
            string sql =@"SELECT * FROM Album";
            dt =new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            return dt;

        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DataRow dongmoi = dt.NewRow();
            dongmoi["Maalbum"] = txtMaalbum;
            dongmoi["Tenalbum"] = txtTenalbum;
            dt.Rows.Add(dongmoi);

            string ins = @"INSERT Album(Maalbum,Tenalbum) VALUES (@maalbum,@tenalbum)";
            SqlCommand cmd = new SqlCommand(ins, cn);
            cmd.Parameters.Add("@maalbum", SqlDbType.NChar, 5, "Maalbum");
            cmd.Parameters.Add("@tenalbum", SqlDbType.NVarChar, 50, "Tenalbum");
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = cmd;
            da.Update(dt);
            MessageBox.Show("Thêm Album thành công");

        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter();

            string del = "DELETE from Album where Maalbum = @maalbum";
            SqlCommand cmd = new SqlCommand(del, cn);
            cmd.Parameters.Add("@maalbum", SqlDbType.NChar, 5, "Maalbum");
            da.DeleteCommand = cmd;
            da.Update(dt);
            MessageBox.Show("Lưu thông tin thành công");
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            DialogResult t = MessageBox.Show("Bạn có muốn đóng Album?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (t == DialogResult.Yes)
                this.Close();

                
        }

    }
}
