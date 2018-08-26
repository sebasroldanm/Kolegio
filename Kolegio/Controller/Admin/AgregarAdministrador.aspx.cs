using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



public partial class View_Admin_AgregarAdministrador : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cache.SetNoStore();
        //if (Session["userId"] != null)
        //{
        //    //fechanac.ReadOnly = true;
        //    //btnigm_calendar.Visible = false;
        int year;
        year = int.Parse(DateTime.Now.ToString("yyyy"));
        year = year - 18;
        CalendarExtender1.EndDate = Convert.ToDateTime("31/12/" + year);
        //}
        //else
        //    Response.Redirect("AccesoDenegado.aspx");
    }

    protected void btn_AdministradorAceptar_Click2(object sender, EventArgs e)
    {

        EUser usua = new EUser();
        DaoUser dat = new DaoUser();
        int rol = 1;

        int dep;
        dep = int.Parse(ddt_lugarnacimDep.SelectedValue);

        int ciu;
        ciu = int.Parse(DDT_Ciudad.SelectedValue);

        if (ddt_lugarnacimDep.SelectedValue == "0" || DDT_Ciudad.SelectedValue == "0")
        {
            L_ErrorUsuario.Text = "Debe seleccionar una opcion";
        }
        else
        { 
            usua.Nombre = tb_AdministradorAdministradorNombre.Text;
            usua.Rol = Convert.ToString(rol);
            usua.UserName = tb_AdministradorUsuario.Text;
            usua.Clave = tb_AdministradorContrasenia.Text;
            usua.Correo = tb_AdministradorAdministradorCorreo.Text;
            usua.Apellido = tb_AdministradorAdministradorApellido.Text;
            usua.Direccion = tb_AdministradorAdministradorDireccion.Text;
            usua.Telefono = tb_AdministradorTelefono.Text;
            usua.Documento = tb_AministradorAdministradorId.Text;
            usua.fecha_nacimiento = fechanac.Text;
            usua.Departamento = Convert.ToString(dep);
            usua.Ciudad = Convert.ToString(ciu);
            usua.Session = Session.SessionID;
            usua.Foto = cargarImagen();
      

            if (usua.Foto != null)
            {
                dat.insertarUsuarios(usua);
                this.Page.Response.Write("<script language='JavaScript'>window.alert('Administrador Insertado con Exito');</script>");

                btn_AdministradorAceptar.Visible = false;

            }
        }
    }

    protected void btn_AdministradorNuevo_Click(object sender, EventArgs e)
    {
        fechanac.Text = "";
        tb_AdministradorAdministradorNombre.Text = "";
        tb_AdministradorUsuario.Text = "";
        tb_AdministradorContrasenia.Text = "";
        tb_AdministradorAdministradorCorreo.Text = "";
        tb_AdministradorAdministradorApellido.Text = "";
        tb_AdministradorAdministradorDireccion.Text = "";
        tb_AdministradorTelefono.Text = "";
        tb_AministradorAdministradorId.Text = "";
        tb_AministradorAdministradorId.Focus();
        btn_EstudianteNuevo.Visible = false;
        btn_validar.Visible = true;
        L_ErrorUsuario.Text = "";     
        tb_AdministradorUsuario.ReadOnly = false;
        tb_AministradorAdministradorId.ReadOnly = false;
        L_ErrorUsuario.Text = "";
        L_OkUsuario.Text = "";
        btnigm_calendar.Visible = false;

    }



    protected void btn_validar_Click(object sender, EventArgs e)
    {
  
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();


        usua.UserName = tb_AdministradorUsuario.Text;
        usua.Documento = (Convert.ToInt64(tb_AministradorAdministradorId.Text)).ToString();

        DataTable registros = dat.validar_usuarioadmin(usua);

        if (registros.Rows.Count > 0)
        {

            tb_Vusuario.Text = Convert.ToString(registros.Rows[0]["user_name"].ToString());
            tb_Vdocumento.Text = Convert.ToString(registros.Rows[0]["num_documento"].ToString());
            L_ErrorUsuario.Text = "El Usuario ya existe";



        }
        else
        {
            L_ErrorUsuario.Text = "";
            L_OkUsuario.Text = "Usuario Disponible";
            btn_AdministradorAceptar.Visible = true;
            btn_EstudianteNuevo.Visible = true;
            btn_validar.Visible = false;
            tb_AdministradorUsuario.ReadOnly = true;
            tb_AministradorAdministradorId.ReadOnly = true;
            tb_AdministradorFoto.Enabled = true;
            btnigm_calendar.Visible = true;
        }


    }


    protected String cargarImagen()
    {
        ClientScriptManager cm = this.ClientScript;
        String nombreArchivo = System.IO.Path.GetFileName(tb_AdministradorFoto.PostedFile.FileName);
        String extension = System.IO.Path.GetExtension(tb_AdministradorFoto.PostedFile.FileName);
        String saveLocation = "";

    if (!(string.Compare(extension, ".png", true) == 0 || string.Compare(extension, ".jpeg", true) == 0 || string.Compare(extension, ".jpg", true)==0))
     {
          cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Solo se admiten imagenes en formato Jpeg o Gif');</script>");
            btnigm_calendar.Visible = true;
            

          return null;
      }

        saveLocation = Server.MapPath("~/FotosUser") + "/" + nombreArchivo;

       if (System.IO.File.Exists(saveLocation))
       {
          cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe una imagen en el servidor con ese nombre');</script>");
        return null;
      }

        tb_AdministradorFoto.PostedFile.SaveAs(saveLocation);
        cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo de imagen ha sido cargado');</script>");

        return "~/FotosUser" + "/" + nombreArchivo;
    }




}