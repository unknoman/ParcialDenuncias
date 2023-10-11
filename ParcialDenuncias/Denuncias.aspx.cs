using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParcialDenuncias
{
    public partial class Denuncias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        public void actualizar()
        {
            DropDownList2.DataBind();
            GridView1.DataBind();
            GridView2.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(TextBox1.Text) && DropDownList1.SelectedValue != "")
            {
                SqlDataSource1.Insert();
                actualizar();

            } else
            {
                Label3.Text = "Verifica los campos";
            }
             
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = DropDownList2.SelectedItem.ToString();
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text) && DropDownList2.SelectedValue != "")
            {
                SqlDataSource1.Update();
                actualizar();
            }
            else
            {
                Label3.Text = "Verifica los campos";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue != "")
            {
                SqlDataSource1.Delete();
                actualizar();
            }
            else
            {
                Label3.Text = "Verifica que tengas seleccionado una denuncia para eliminar";
            }

        }
    }
}