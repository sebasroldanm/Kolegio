using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_EditarEliminarProfesor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            tb_DocenteNombre.ReadOnly = true;
            tb_DocenteApellido.ReadOnly = true;
            tb_DocenteCorreo.ReadOnly = true;
            tb_DocenteDireccion.ReadOnly = true;
            tb_DocenteTelefono.ReadOnly = true;
            tb_DocenteUsuario.ReadOnly = true;
            tb_DocenteContrasenia.ReadOnly = true;
            //fechanac.ReadOnly = true;
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
        
    }





    protected void btn_DocenteNuevo_Click(object sender, EventArgs e)
    {

        tb_DocenteId.Enabled = true;
        tb_DocenteNombre.Text = "";
        tb_DocenteUsuario.Text = "";
        tb_DocenteContrasenia.Text = "";
        tb_DocenteCorreo.Text = "";
        tb_DocenteApellido.Text = "";
        tb_DocenteDireccion.Text = "";
        tb_DocenteTelefono.Text = "";
        tb_DocenteId.Text = "";
        L_ErrorAdmin.Text = "";
        fechanac.Text = "";


        tb_DocenteNombre.ReadOnly = true;
        tb_DocenteApellido.ReadOnly = true;
        tb_DocenteCorreo.ReadOnly = true;
        tb_DocenteDireccion.ReadOnly = true;
        tb_DocenteTelefono.ReadOnly = true;
        tb_DocenteUsuario.ReadOnly = true;
        tb_DocenteContrasenia.ReadOnly = true;
        fechanac.ReadOnly = true;
        tb_DocenteId.ReadOnly = false;

        tb_DocenteId.Focus();
        btn_DocenteEditar.Visible = false;
        btn_DocenteNuevo.Visible = false;
        btn_DocenteAceptar.Visible = true;

    }

    protected void btn_DocenteAceptar_Click(object sender, EventArgs e)
    {
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();

        usua.Documento = tb_DocenteId.Text;

        DataTable registros = dat.obtenerUsuarioMod(usua);

        if (registros.Rows.Count > 0)
        {
            tb_DocenteNombre.Text = Convert.ToString(registros.Rows[0]["nombre_usua"].ToString());
            tb_DocenteApellido.Text = Convert.ToString(registros.Rows[0]["apellido_usua"].ToString());
            tb_DocenteCorreo.Text = Convert.ToString(registros.Rows[0]["correo"].ToString());
            tb_DocenteDireccion.Text = Convert.ToString(registros.Rows[0]["direccion"].ToString());
            tb_DocenteTelefono.Text = Convert.ToString(registros.Rows[0]["telefono"].ToString());
            tb_DocenteUsuario.Text = Convert.ToString(registros.Rows[0]["user_name"].ToString());
            tb_DocenteContrasenia.Text = Convert.ToString(registros.Rows[0]["clave"].ToString());
            fechanac.Text = Convert.ToString(registros.Rows[0]["fecha_nac"].ToString());
            //this.Page.Response.Write("<script language='JavaScript'>window.alert('<<Listo men>>');</script>");

            tb_DocenteId.ReadOnly = true;
            tb_DocenteNombre.ReadOnly = false;
            tb_DocenteApellido.ReadOnly = false;
            tb_DocenteCorreo.ReadOnly = false;
            tb_DocenteDireccion.ReadOnly = false;
            tb_DocenteTelefono.ReadOnly = false;
            tb_DocenteUsuario.ReadOnly = false;
            tb_DocenteContrasenia.ReadOnly = false;
            fechanac.ReadOnly = false;
            L_ErrorAdmin.Text = "";


            btn_DocenteEditar.Visible = true;
            btn_DocenteNuevo.Visible = true;
            btn_DocenteAceptar.Visible = false;

        }
        else
        {

            L_ErrorAdmin.Text = "Sin Registros";

        }

    }

    protected void btn_DocenteEditar_Click(object sender, EventArgs e)
    {
        {
            EUser Edusua = new EUser();
            DaoUser datos = new DaoUser();
            int rol = 2;
            String foto = "C://Hii";
            if (ddt_lugarnacimDep.SelectedValue == "0" || DDT_Ciudad.SelectedValue == "0")
            {
                L_Error.Text = "Debe seleccionar una opcion";
            }
            else
            {
                Edusua.Nombre = tb_DocenteNombre.Text;
                Edusua.Rol = Convert.ToString(rol);
                Edusua.UserName = tb_DocenteUsuario.Text;
                Edusua.Clave = tb_DocenteContrasenia.Text;
                Edusua.Correo = tb_DocenteCorreo.Text;
                Edusua.Apellido = tb_DocenteApellido.Text;
                Edusua.Direccion = tb_DocenteDireccion.Text;
                Edusua.Telefono = tb_DocenteTelefono.Text;
                Edusua.Documento = tb_DocenteId.Text;
                //usua.Foto = tb_AdministradorFoto.FileName;
                Edusua.Foto = foto;
                Edusua.fecha_nacimiento = fechanac.Text;
                Edusua.Session = Session.SessionID;


                DataTable registros = datos.EditarUsuario(Edusua);
                this.Page.Response.Write("<script language='JavaScript'>window.alert('Docente Editado con Exito');</script>");
            }
            
        }

        tb_DocenteId.ReadOnly = true;
        tb_DocenteNombre.ReadOnly = false;
        tb_DocenteApellido.ReadOnly = false;
        tb_DocenteCorreo.ReadOnly = false;
        tb_DocenteDireccion.ReadOnly = false;
        tb_DocenteTelefono.ReadOnly = false;
        tb_DocenteUsuario.ReadOnly = false;
        tb_DocenteContrasenia.ReadOnly = false;
        btn_DocenteEditar.Visible = true;
        btn_DocenteNuevo.Visible = true;
        btn_DocenteAceptar.Visible = false;
    }
}