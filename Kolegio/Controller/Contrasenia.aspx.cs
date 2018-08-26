using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Contrasenia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        if (Request.QueryString.Count > 0)
        {
            DaoUser user = new DaoUser();
            DataTable info = user.obtenerUsusarioToken(Request.QueryString[0]);

            if (int.Parse(info.Rows[0][0].ToString()) == -1)

                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El Token es invalido. Genere uno nuevo');window.location=\"Loggin.aspx\"</script>");

            else if (int.Parse(info.Rows[0][0].ToString()) == -1)
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El Token esta vencido. Genere uno nuevo');window.location=\"Loggin.aspx\"</script>");
            else
                Session["user_id"] = int.Parse(info.Rows[0][0].ToString());
        }
        else
            Response.Redirect("~/View/Loggin.aspx");
    }

    protected void B_Enviar_Click(object sender, EventArgs e)
    {
        DaoUser user = new DaoUser();
        EUserContrasenia eUser = new EUserContrasenia();

        eUser.UserId = int.Parse(Session["user_id"].ToString());
        eUser.Clave = TB_NuevamenteClave.Text;

        user.actualziarContrasena(eUser);
        this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Su Contraseña ha sido actualizada.');window.location=\"Loggin.aspx\"</script>");
    }
}
