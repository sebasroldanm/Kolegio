using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class View_Acudiente_AcudienteObservador : System.Web.UI.Page
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
            enc.Id_estudiante = DDT_estudiante.SelectedValue;

            DataTable registros = datos.obtenerCursoEst(enc);
            if (registros.Rows.Count > 0)
            {
                Session["anio"] = registros.Rows[0]["id_ancu"].ToString();
                Session["est"] = DDT_estudiante.SelectedValue;
            }
            else
            {
                Session["anio"] = "0";
                Session["est"] = DDT_estudiante.SelectedValue;
            }
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}