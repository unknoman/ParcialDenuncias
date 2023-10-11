using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParcialDenuncias
{
    public partial class DenunciasCategoria : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = ListBox1.SelectedItem.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(TextBox1.Text))
            {
               int valor = SqlDataSource1.Insert();

                GridView1.DataBind();
                if(valor > 0)
                    Label2.Text = "Se insertaron los datos correctamente";
            } else
            {
                Label2.Text = "Llena todos los campos antes de continuar";
            }
           
        }
        public void actualizar()
        {
            GridView1.DataBind();
            ListBox1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                int valor = SqlDataSource1.Update();

                GridView1.DataBind();
                if (valor > 0)
                    Label2.Text = "Se actualizaron los datos correctamente";
            }
            else
            {
                Label2.Text = "Llena todos los campos antes de continuar";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if(ListBox1.SelectedValue != "")
            {
                try
                {
                    int valor = SqlDataSource1.Delete();
                    if (valor > 0)
                        Label2.Text = "Se elimino correctamente";
                    actualizar();


                } catch (Exception ex)
                {
                    Label2.Text = ex.Message;
                }
               
            }
        }
    }
}