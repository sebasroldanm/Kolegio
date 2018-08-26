using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Profesor_ProfesorObservacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            DaoUser datos = new DaoUser();
            DateTime fecha = DateTime.Now;
            string año = (fecha.Year).ToString();
            año = año + "-01-01";
            DataTable re = datos.obtenerAniodeCurso(año);
            Session["anio"] = re.Rows[0]["id_anio"];
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
        
    }

    protected void ddt_curso_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();

        Session["documentoestudiante"] = GridView2.SelectedRow.Cells[0].Text;
        enc.Documento = Session["documentoestudiante"].ToString();

        DataTable registro = datos.obtenerUsuarioMod(enc);
        Session["id"] = registro.Rows[0]["id_usua"];

        Response.Redirect("/View/Profesor/ProfesorListado.aspx");

    }
}