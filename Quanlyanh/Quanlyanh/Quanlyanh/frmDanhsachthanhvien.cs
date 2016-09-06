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

       
          
               
        

     

        private void btnLuu_Click(object sender, EventArgs e)
        {
            ////Thêm thành viên trực tiếp vào dt ko cần dùng form kết nối 
            //SqlDataAdapter da = new SqlDataAdapter();
            //SqlCommand cmd; // khai báo chung cho các hàm dưới
            //string ins = @"INSERT INTO Thanhvien Values(@ID,@ho,@ten,@sdt,@diachi,@email)";
            //cmd = new SqlCommand(ins, cn);
            //cmd.Parameters.Add("@ID", SqlDbType.NChar, 5, "Mathanhvien");
            //cmd.Parameters.Add("@ho", SqlDbType.NVarChar, 50, "Ho");
            //cmd.Parameters.Add("@ten", SqlDbType.NVarChar, 50, "Ten");
            //cmd.Parameters.Add("@sdt", SqlDbType.Int,11, "SDT");
            //cmd.Parameters.Add("@diachi", SqlDbType.NVarChar, 50, "Diachi");
            //cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50, "Email");
            //da = new SqlDataAdapter();
            //da.InsertCommand = cmd; // cập nhật thay đổi trở lại cơ sở dữ liệu 
           
            //da.Update(dt);

            // Xóa thành viên sử dụng nút Delete
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            string del = @"DELETE from Thanhvien where Mathanhvien = @mathanhvien";
            cmd = new SqlCommand(del, cn);
            cmd.Parameters.Add("@mathanhvien", SqlDbType.NChar, 5, "Mathanhvien");
            da.DeleteCommand = cmd;
            Refresh();
         
           da.Update(dt);
            
           

             //Sửa thông tin thành viên
            string upd = @"UPDATE Thanhvien set  Mathanhvien =@mathanhvien";
            cmd = new SqlCommand(upd, cn);
            cmd.Parameters.Add("@mathanhvien",SqlDbType.NChar, 5, "Mathanhvien");
            da.UpdateCommand = cmd;
           // MessageBox.Show("Cập nhật thông tin thành công");
            Refresh();
            da.Update(dt);
        

           
        }

        private void btnSau_Click(object sender, EventArgs e)
        {
            
            
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult t = MessageBox.Show("Bạn có muốn thoát chương trình?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (t == DialogResult.Yes)
                Application.Exit();


        }
       
       
    }
}
