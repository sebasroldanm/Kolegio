using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_EditarPaginaInicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            //fechanac.ReadOnly = true;
            string year;
            year = DateTime.Now.ToString("MM/dd/yyyy");
            CalendarExtender1.StartDate = DateTime.Now;
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
    }

    protected void B_Modificar_Click(object sender, EventArgs e)
    {
        EUser Edusua = new EUser();
        DaoUser datos = new DaoUser();

        Edusua.Inicio = TB_Nosotros.Text;
        Edusua.Mision = TB_Mision.Text;
        Edusua.Vision = TB_Vision.Text;
        Edusua.Session = Session.SessionID;

        DataTable registros = datos.editarInicio(Edusua);
        this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Datos Modificados.');window.location=\"EditarPaginaInicio.aspx\"</script>");
    }


    protected void B_Traer_Click(object sender, EventArgs e)
    {
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();

        DataTable registros = dat.incio();

        if (registros.Rows.Count > 0)
        {
            TB_Nosotros.Text = Convert.ToString(registros.Rows[0]["inicio_cont"].ToString());
            TB_Mision.Text = Convert.ToString(registros.Rows[0]["mision_inicio"].ToString());
            TB_Vision.Text = Convert.ToString(registros.Rows[0]["vision_inicio"].ToString());
            
        }
    }

    protected void B_Terminaranio_Click(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();

        enc.Año = fechanac.Text;
        datos.editaFinaño(enc);

        bool ok = true;
        datos.editaBool(ok);

        this.Page.Response.Write("<script language='JavaScript'>window.alert('Insertado con Exito');</script>");
    }
}