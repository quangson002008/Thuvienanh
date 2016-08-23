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
    public partial class frmDanhsachthanhvien : Form
    {
        string cnstr;
        SqlConnection cn;
        DataTable dt;
        public frmDanhsachthanhvien()
        {
            InitializeComponent();
        }

      
        private void frmDanhsachthanhvien_Load(object sender, EventArgs e)
        {
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
            cn = new SqlConnection(cnstr);
            dgvDsthanhvien.DataSource = Getusers();
            txtMathanhvien.DataBindings.Add("Text", dt, "Mathanhvien");
            txtHo.DataBindings.Add("Text", dt, "Ho");
            txtTenthanhvien.DataBindings.Add("Text", dt, "Ten");
            txtSodienthoai.DataBindings.Add("Text", dt, "SDT");
            txtDiachi.DataBindings.Add("Text", dt, "Diachi");
            txtEmail.DataBindings.Add("Text", dt, "Email");


        }
        
        private DataTable Getusers()
        {
            try
            {
            string sql = @"SELECT * FROM Thanhvien";
            
                //DataTable dt = new DataTable ();
            dt = new DataTable();
                  
                SqlDataAdapter da = new SqlDataAdapter(sql,cn);
                da.Fill(dt);
                return dt;
            }
            catch (Exception  )
            {
               

                throw;
            }
            finally
            {
                cn.Close();

            }

           
            
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = @"DELETE FROM Thanhvien (Mathanhvien,Ho,Ten,SDT,Diachi,Email)  VALUES (N'" + txtMathanhvien.Text + "', N'" + txtHo.Text + "', N'" + txtTenthanhvien.Text + "', " + txtSodienthoai.Text + ",N'" + txtDiachi.Text + "',N'" + txtEmail.Text + "')";
            try
            {

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter();
                MessageBox.Show(" đã xóa thành viên!");
                da.Update(dt);
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
       
    }
}
