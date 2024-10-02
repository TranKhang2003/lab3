using System.Data;
using System.Data.SqlClient;

namespace Lab2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            LoadQueQuanToComboBox();
        }

        SqlConnection cnn = new SqlConnection(@"Data Source=607-21\SQLEXPRESS;Initial Catalog=QLThucTap;Integrated Security=True");

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "SELECT Mssv, Hoten, Quequan, Ngaysinh, Hocluc FROM SinhVien";

            using (SqlConnection conn = new SqlConnection(@"Data Source=607-21\SQLEXPRESS;Initial Catalog=QLThucTap;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        dataGridView1.DataSource = dt;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.Message);
                    }
                }
            }
        }

        private void LoadQueQuanToComboBox()
        {
            // Câu truy vấn để lấy danh sách quê quán từ bảng Sinhvien
            string query = "SELECT DISTINCT Quequan FROM SinhVien";

            using (SqlConnection conn = new SqlConnection(@"Data Source=607-21\SQLEXPRESS;Initial Catalog=QLThucTap;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Xóa các mục cũ trong comboBox1
                        comboBox1.Items.Clear();

                        // Đọc từng dòng kết quả và thêm quê quán vào comboBox1
                        while (reader.Read())
                        {
                            comboBox1.Items.Add(reader["Quequan"].ToString());
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.Message);
                    }
                }
            }
        }


        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
