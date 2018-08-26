using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Profesor_ProfesorListado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            tb_documentoestudiante.Text = (string)Session["documentoestudiante"];
            tb_documentoestudiante.ReadOnly = true;
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
        
       
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
     //  Session["documentoestudiante"] = GridView1.SelectedRow.Cells[0].Text;
     //   Response.Redirect("/View/Admin/EditarEliminarAdministrador.aspx");
    }

    protected void btn_AdministradorAceptar_Click2(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();

        enc.Id_estudiante = Session["id"].ToString();
        enc.Observacion = TB_Observ.Text.ToString();

        datos.insertarObservacion(enc);
        GridView1.DataBind();
    }

    protected void tb_documentoestudiante_TextChanged(object sender, EventArgs e)
    {

    }
}