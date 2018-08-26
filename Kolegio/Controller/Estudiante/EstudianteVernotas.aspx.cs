using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class View_Estudiante_EstudianteVernotas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            DaoUser datos = new DaoUser();
            EUser enc = new EUser();
            DateTime fecha = DateTime.Now;
            string año = (fecha.Year).ToString();
            año = año + "-01-01";
            DataTable re = datos.obtenerAniodeCurso(año);
            enc.Año = re.Rows[0]["id_anio"].ToString();
            enc.Id_estudiante = Session["userId"].ToString();

            DataTable registros =  datos.obtenerCursoEst(enc);
            Session["anio"]  = registros.Rows[0]["id_ancu"].ToString();

        }
        else
            Response.Redirect("AccesoDenegado.aspx");

    }

    protected void GV_boletin_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}