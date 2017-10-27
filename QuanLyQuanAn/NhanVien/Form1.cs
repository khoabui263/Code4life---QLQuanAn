using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NhanVien
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void bunifuFlatButton1_Click(object sender, EventArgs e)
        {

        }

        private void bunifuFlatButton6_Click(object sender, EventArgs e)
        {
            if (this.pMenu.Size.Width == 168)
                this.pMenu.Size = new System.Drawing.Size(53, 729);
            else
                this.pMenu.Size = new System.Drawing.Size(168, 729);
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            
        }

        private void bunifuTextbox1_OnTextChange(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel5_Paint(object sender, PaintEventArgs e)
        {

        }

        private void bunifuFlatButton4_Click(object sender, EventArgs e)
        {
            if (this.pMenu.Size.Width == 168)
                this.pMenu.Size = new System.Drawing.Size(53, 729);
            else
                this.pMenu.Size = new System.Drawing.Size(168, 729);
        }
    }
}
