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
    public partial class FrmRptThanhvien : Form
    {
        string cnstr;
        SqlConnection cn;
        DataTable dt;
        public FrmRptThanhvien()
        {
            InitializeComponent();
        }

        private void FrmRptThanhvien_Load(object sender, EventArgs e)
        {
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
            cn = new SqlConnection(cnstr);
            DataTable dt = Getusers();
            this.reportViewer1.RefreshReport();
            ThanhvienBindingSource.DataSource = dt;
        }
        private DataTable Getusers()
        {
           
                string sql = @"SELECT * FROM Thanhvien";              
                dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(sql, cn);
                da.Fill(dt);
                return dt;
           

        }
    }
}
