using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace AutoCAD_test_application
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
            
        }
        
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        
        public bool buttonClicked;
        public void Bclick()
        {
            buttonClicked = true;
            
        }
        public void button1_Click(object sender, EventArgs e)
        {

            Bclick();
            
            
        }
        public string GetInterconnection()
        {
            do
            {
                if (comboBox1.Text == "" && textBox1.Text == "" && buttonClicked == true)
            {

                MessageBox.Show("NO INTERCONNECTION NAME WAS CHOSEN");
                
                this.Close();
                return "CUSTOM!";
            }   
            else if(textBox1.Text != "" && buttonClicked == true)
            {
                this.Close();
                return textBox1.Text;
            }
            else if(comboBox1.Text != "" && buttonClicked == true)
            {
                this.Close();
                return comboBox1.Text;
               
            }
            else
            {
                return "";
            }
        } while (buttonClicked = false);
        }


        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
