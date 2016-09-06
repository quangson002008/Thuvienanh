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
    public partial class frmThuvienanh : Form
    {
        string cnstr;
        SqlConnection cn;
        DataTable dt;
        public frmThuvienanh()
        {
            InitializeComponent();
        }

        //private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    cbAlbum.DataSource = getalbum()
        //    cbAlbum.DisplayMember = "Maalbum";
        //    cbAlbum.ValueMember = "Tenalbum";

        //}
        private void LoadAlbum()
        {
            cbAlbum.DataSource = getalbum();
            cbAlbum.DisplayMember = "Maalbum";
            cbAlbum.ValueMember = "Tenalbum";
        }
        private DataTable getalbum()
        {
            string sql = @"SELECT * FROM Album";
            dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            return dt;

        }

        private void frmThuvienanh_Load(object sender, EventArgs e)
        {
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
            cn = new SqlConnection(cnstr);
            dgvHinhanh.DataSource = getthuvienanh();

            txtMahinhanh.DataBindings.Add("Text", dt, "Mahinhanh");
            txtTenhinh.DataBindings.Add("Text", dt, "Tenhinhanh");
            cbAlbum.DataBindings.Add("Text", dt, "Maalbum");
            txtGhichu.DataBindings.Add("Text", dt, "Ghichu");
            txtNgayluu.DataBindings.Add("Text", dt, "Ngayluu");
            txtAnh.DataBindings.Add("Text", dt, "Hinhanh");
            
            LoadAlbum();
           
        


        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmAlbum ab = new frmAlbum();
            ab.ShowDialog();
        }
        private DataTable getthuvienanh()
    {
        try
        {
            string sql = @"SELECT * FROM Hinhanh";
            dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            return dt;
        }
        catch (Exception)
        {
            throw;

        }
        finally
        {
            cn.Close();
        }

    }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult t = MessageBox.Show("Bạn có muốn thoát chương trình?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (t == DialogResult.Yes)
                Application.Exit();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog Ofd = new OpenFileDialog();
            Ofd.Filter = "JPG|*.jpg|PNG|*.png| All Files(*.*)|*.*";
            Ofd.InitialDirectory = "";
            Ofd.ShowDialog();
            string CorrectFileName = System.IO.Path.GetFileName(Ofd.FileName); // Cái này dùng để get Name của File(Get từ đường dẫn)
            txtAnh.Text = Ofd.FileName;
            if (string.IsNullOrEmpty(Ofd.FileName)) return;
            Image img = Image.FromFile(Ofd.FileName);
            pictureBox1.Image = img;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            //if (txtMahinhanh.Text == "" || txtTenhinh.Text == "" || cbAlbum.Text == "" || txtTieucu.Text == "" || txtAnh.Text == "" || txtMathanhvien.Text == "")
            //{
            //    MessageBox.Show("Vui lòng điền đầy đủ thông tin!", "Thông báo!");
            //    return;
            //}
            string CorrectFileName = System.IO.Path.GetFileName(txtAnh.Text);
            string paths = Application.StartupPath.Substring(0, Application.StartupPath.Length - 10);
            DataRow dongmoi = dt.NewRow();



            dongmoi["Mahinhanh"] = txtMahinhanh;
            dongmoi["Tenhinhanh"] = txtTenhinh;
            dongmoi["Maalbum"] = cbAlbum;
            dongmoi["Ngayluu"] = txtNgayluu.Value;
            dongmoi["Tieucu"] = txtTieucu;
            dongmoi["Ghichu"] = txtGhichu;
            dongmoi["Hinhanh"] = txtAnh;
            dongmoi["Mathanhvien"] = txtMathanhvien;
            dt.Rows.Add(dongmoi);

            string ins = @"INSERT into Hinhanh (Mahinhanh,Tenhinhanh,Maalbum,Ngayluu,Tieucu,Ghichu,Hinhanh,Mathanhvien) VALUES (@mahinhanh,@tenhinhanh,@maalbum,@ngayluu,@tieucu,@ghichu,@hinhanh,@mathanhvien)";


            SqlCommand cmd = new SqlCommand(ins, cn);
            cmd.Parameters.Add("@mahinhanh", SqlDbType.NChar, 5, "Mahinhanh");
            cmd.Parameters.Add("@tenhinhanh", SqlDbType.NVarChar, 50, "Tenhinhanh");
            cmd.Parameters.Add("@maalbum", SqlDbType.NChar, 5, "Maalbum");
            cmd.Parameters.Add("@ngayluu", SqlDbType.DateTime, 50, "Ngayluu");
            cmd.Parameters.Add("@tieucu", SqlDbType.Char, 10, "Tieucu");
            cmd.Parameters.Add("@ghichu", SqlDbType.NVarChar, 50, "Ghichu");
            cmd.Parameters.Add("@hinhanh", SqlDbType.VarChar, 255, "Hinhanh");
            cmd.Parameters.Add("@mathanhvien", SqlDbType.NChar, 5, "Mathanhvien");
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = cmd;
            da.Update(dt);
            MessageBox.Show("Thêm Album thành công");
                                            
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter();

            string del = "DELETE from Album where Mahinhanh = @mahinhanh";
            SqlCommand cmd = new SqlCommand(del, cn);
            cmd.Parameters.Add("@mahinhanh", SqlDbType.NChar, 5, "Mahinhanh");
            da.DeleteCommand = cmd;
            da.Update(dt);
            MessageBox.Show("Lưu thông tin thành công");
        }

        //private void button4_Click(object sender, EventArgs e)
        //{
        //    SqlDataAdapter da = new SqlDataAdapter();

        //    string del = "DELETE from Album where Maalbum = @maalbum";
        //    SqlCommand cmd = new SqlCommand(del, cn);
        //    cmd.Parameters.Add("@maalbum", SqlDbType.NChar, 5, "Maalbum");
        //    da.DeleteCommand = cmd;
        //    da.Update(dt);
        //    MessageBox.Show("Lưu thông tin thành công");
        //}

        
    }
}
