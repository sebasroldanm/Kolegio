using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Profesor_ProfesorMensaje : System.Web.UI.Page
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
            TB_Destinatario.Enabled = false;
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
    }

    protected void B_Actualizar_Click(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        int alumno;
        alumno = int.Parse(DDL_Alumno.SelectedValue);
        DataTable mensaje = datos.acudientemensaje(alumno);
        if (mensaje.Rows.Count > 0)
        {
            //B_Enviar.Enabled = true;
            TB_Destinatario.Text = mensaje.Rows[0]["correo"].ToString();
        }
        else
        {
            TB_Destinatario.Text = "";
        }
    }

    protected void B_Enviar_Click(object sender, EventArgs e)
    {
        if (DDL_Materia.SelectedValue == "0" || DDL_Alumno.SelectedValue == "0" || DDL_Curso.SelectedValue == "0")
        {
            L_Verificar.Text = "Debe seleccionar una opcion";
        }
        else
        {
            string userId = Session["userId"].ToString();
            string persona = Session["nombre"].ToString();
            string apePersona = Session["apellido"].ToString();
            string correo_l = Session["correo"].ToString();
            string destinatario = TB_Destinatario.ToString();
            string asunto = TB_Asuto.Text;
            string mensaje = TB_Mensaje.Text;

            //CORREO*******************************
            EUser encapsular = new EUser();
            DaoUser datos = new DaoUser();
            encapsular.Correo = TB_Destinatario.Text.ToString();
            DataTable resultado = datos.verificarCorreo(encapsular);

            if (resultado.Rows.Count > 0)
            {
                DaoUser dao = new DaoUser();
                mensaje = mensaje + "<br><br>Atentamente: " + persona + " " + apePersona + "<br>Correo para responder: " + correo_l + "";
                string cadena = mensaje;
                CorreoEnviar correo = new CorreoEnviar();
                correo.enviarCorreoEnviar(destinatario, asunto, mensaje);
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Su Mensaje ha sido Enviado.');window.location=\"ProfesorMensaje.aspx\"</script>");
            }
            else
            {
                L_Verificar.Text = "El correo digitado no existe";
                TB_Destinatario.Text = "";
            }
        }
    }
}