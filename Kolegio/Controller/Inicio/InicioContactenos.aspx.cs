using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Inicio_InicioContactenos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void B_Enviar_Click(object sender, EventArgs e)
    {
        String nombres = TB_Nombres.Text;
        String apellidos = TB_Apellidos.Text;
        String correo_l = TB_Correo.Text;
        String telefono = TB_Telefono.Text;
        String mensaje = TB_Mensaje.Text;

        string destinatario = "colegiorespuesta@gmail.com";
        string asunto = "**¡¡CONTACTENOS!!**";

        //CORREO*******************************
        EUser encapsular = new EUser();
        DaoUser datos = new DaoUser();
        encapsular.Correo = destinatario.ToString();
        DataTable resultado = datos.verificarCorreo(encapsular);

        if (resultado.Rows.Count > 0)
        {
            DaoUser dao = new DaoUser();
            mensaje = mensaje + "<br><br>Atentamente: " + nombres + "<br>" + apellidos + "<br>Correo para responder: " + correo_l + "<br>Telefono: " + telefono + "";
            string cadena = mensaje;
            CorreoEnviar correo = new CorreoEnviar();
            correo.enviarCorreoEnviar(destinatario, asunto, mensaje);
            this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Su Mensaje ha sido Enviado.');window.location=\"InicioContactenos.aspx\"</script>");
        }
        else
        {
            this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Ha ocurrido un problema.');window.location=\"InicioContactenos.aspx\"</script>");
        }
    }
}