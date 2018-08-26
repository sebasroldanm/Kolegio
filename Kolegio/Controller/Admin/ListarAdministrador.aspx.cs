using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_ListarAdministrador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            Console.WriteLine("");
        }
        else
            Response.Redirect("AccesoDenegado.aspx");


    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["documento"] = GridView1.SelectedRow.Cells[3].Text;
        Response.Redirect("/View/Admin/EditarEliminarAdministrador.aspx");
      
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
       
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
    }

    protected void btn_descargar_Click(object sender, EventArgs e)
    {
       // Response.Redirect("/View/Admin/DescargarAdministradores.aspx");
        Page.RegisterStartupScript("script", "<script>window.open('/View/Admin/ReporteAdministradores.aspx' ,'Descargar','height=300', 'width=300')</script>");
    }
}