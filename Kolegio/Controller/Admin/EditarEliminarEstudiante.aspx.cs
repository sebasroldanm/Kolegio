using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_EditarEliminarEstudiante : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            tb_EstudianteId.Text = (string)Session["documentoe"];

            tb_EstudianteNombre.ReadOnly = true;
            tb_EstudianteApellido.ReadOnly = true;
            tb_EstudianteCorreo.ReadOnly = true;
            tb_EstudianteDireccion.ReadOnly = true;
            tb_EstudianteTelefono.ReadOnly = true;
            tb_EstudianteUsuario.ReadOnly = true;
            tb_EstudianteContrasenia.ReadOnly = true;
            //fechanac.ReadOnly = true;
        }
        else
            Response.Redirect("AccesoDenegado.aspx");

        

    }



    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
       
    }

    protected void tb_AministradorEstudiantefechanac_TextChanged(object sender, EventArgs e)
    {
       
    }

    protected void btn_AdministradorAceptar_Click(object sender, EventArgs e)
    {
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();

        usua.Documento = tb_EstudianteId.Text;

        DataTable registros = dat.obtenerUsuarioMod(usua);

        if (registros.Rows.Count > 0)
        {
            tb_EstudianteNombre.Text = Convert.ToString(registros.Rows[0]["nombre_usua"].ToString());
            tb_EstudianteApellido.Text = Convert.ToString(registros.Rows[0]["apellido_usua"].ToString());
            tb_EstudianteCorreo.Text = Convert.ToString(registros.Rows[0]["correo"].ToString());
            tb_EstudianteDireccion.Text = Convert.ToString(registros.Rows[0]["direccion"].ToString());
            tb_EstudianteTelefono.Text = Convert.ToString(registros.Rows[0]["telefono"].ToString());
            tb_EstudianteUsuario.Text = Convert.ToString(registros.Rows[0]["user_name"].ToString());
            tb_EstudianteContrasenia.Text = Convert.ToString(registros.Rows[0]["clave"].ToString());
            fechanac.Text= Convert.ToString(registros.Rows[0]["fecha_nac"].ToString());
            //this.Page.Response.Write("<script language='JavaScript'>window.alert('<<Listo men>>');</script>");

            tb_EstudianteId.ReadOnly = true;
            tb_EstudianteNombre.ReadOnly = false;
            tb_EstudianteApellido.ReadOnly = false;
            tb_EstudianteCorreo.ReadOnly = false;
            tb_EstudianteDireccion.ReadOnly = false;
            tb_EstudianteTelefono.ReadOnly = false;
            tb_EstudianteUsuario.ReadOnly = false;
            tb_EstudianteContrasenia.ReadOnly = false;
            fechanac.ReadOnly = false;
            L_ErrorEstudiante.Text = "";
            btn_EstudianteEditar.Visible = true;
            btn_EstudianteNuevo.Visible = true;
            btn_EstudianteAceptar.Visible = false;
        }
        else
        {
            L_ErrorEstudiante.Text = "Sin Registros";
        }



    
    }

    protected void btn_AdministradorEdditar_Click(object sender, EventArgs e)
    {
        {
            EUser Edusua = new EUser();
            DaoUser datos = new DaoUser();
            int rol = 3;
            String foto = "C://Hii";

            if (ddt_lugarnacimDep.SelectedValue == "0" || DDT_Ciudad.SelectedValue == "0")
            {
                L_Error.Text = "Debe seleccionar una opcion";
            }
            else
            {
                Edusua.Nombre = tb_EstudianteNombre.Text;
                Edusua.Rol = Convert.ToString(rol);
                Edusua.UserName = tb_EstudianteUsuario.Text;
                Edusua.Clave = tb_EstudianteContrasenia.Text;
                Edusua.Correo = tb_EstudianteCorreo.Text;
                Edusua.Apellido = tb_EstudianteApellido.Text;
                Edusua.Direccion = tb_EstudianteDireccion.Text;
                Edusua.Telefono = tb_EstudianteTelefono.Text;
                Edusua.Documento = tb_EstudianteId.Text;
                //usua.Foto = tb_AdministradorFoto.FileName;
                Edusua.Foto = foto;
                Edusua.fecha_nacimiento = fechanac.Text;
                Edusua.Session = Session.SessionID;


                DataTable registros = datos.EditarUsuario(Edusua);
                this.Page.Response.Write("<script language='JavaScript'>window.alert('Estudiante Editado con Exito');</script>");
            }
            
        }

    }

    protected void btn_AdministradorNuevo_Click(object sender, EventArgs e)
    {
        tb_EstudianteId.Enabled = true;
        tb_EstudianteNombre.Text = "";
        tb_EstudianteUsuario.Text = "";
        tb_EstudianteContrasenia.Text = "";
        tb_EstudianteCorreo.Text = "";
        tb_EstudianteApellido.Text = "";
        tb_EstudianteDireccion.Text = "";
        tb_EstudianteTelefono.Text = "";
        tb_EstudianteId.Text = "";
        L_ErrorEstudiante.Text = "";
        fechanac.Text = "";


        tb_EstudianteNombre.ReadOnly = true;
        tb_EstudianteApellido.ReadOnly = true;
        tb_EstudianteCorreo.ReadOnly = true;
        tb_EstudianteDireccion.ReadOnly = true;
        tb_EstudianteTelefono.ReadOnly = true;
        tb_EstudianteUsuario.ReadOnly = true;
        tb_EstudianteContrasenia.ReadOnly = true;
        fechanac.ReadOnly = true;
        tb_EstudianteId.ReadOnly = false;

        tb_EstudianteId.Focus();
        btn_EstudianteEditar.Visible = false;
        btn_EstudianteNuevo.Visible = false;
        btn_EstudianteAceptar.Visible = true;




    }
}
