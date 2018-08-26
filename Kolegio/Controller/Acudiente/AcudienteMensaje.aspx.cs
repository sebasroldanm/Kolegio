using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Acudiente_AcudienteMensaje : System.Web.UI.Page
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

    protected void B_Enviar_Click(object sender, EventArgs e)
    {
        string destinatario;
        string a = DDL_Estudiante.SelectedValue.ToString();
        int estu;
        estu = Convert.ToInt32(a);

        destinatario = DDL_Profesor.SelectedValue.ToString();


        string userId = Session["userId"].ToString();
        string persona = Session["nombre"].ToString();
        string apePersona = Session["apellido"].ToString();
        string correo_l = Session["correo"].ToString();


        string asunto = TB_Asuto.Text;
        string mensaje = TB_Mensaje.Text;

        //CORREO*******************************
        EUser encapsular = new EUser();
        DaoUser datos = new DaoUser();
        encapsular.Correo = destinatario;
        DataTable resultado = datos.verificarCorreo(encapsular);

        if (resultado.Rows.Count > 0)
        {
            DaoUser dao = new DaoUser();
            mensaje = mensaje + "<br><br>Atentamente: " + persona + " " + apePersona + "<br>Correo para responder: " + correo_l + "";
            string cadena = mensaje;
            CorreoEnviar correo = new CorreoEnviar();
            correo.enviarCorreoEnviar(destinatario, asunto, mensaje);
            this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Su Mensaje ha sido Enviado.');window.location=\"AdministradorMensaje.aspx\"</script>");
        }
        else
        {
            L_Verificar.Text = "El correo digitado no existe";
        }
    }
}