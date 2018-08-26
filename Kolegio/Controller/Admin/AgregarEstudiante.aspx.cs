using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class View_Admin_AgregarEstudiante : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            //fechanac.ReadOnly = true;
            //btnigm_calendar.Visible = false;
            int year;
            year = int.Parse(DateTime.Now.ToString("yyyy"));
            year = year - 5;
            CalendarExtender1.EndDate = Convert.ToDateTime("31/12/" + year);
        }
        else
            Response.Redirect("AccesoDenegado.aspx");

    }

    protected void btn_AdministradorAceptar_Click2(object sender, EventArgs e)
    {
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();
        int rol = 3;
        int ciu;
        int dep;

        ciu = int.Parse(DDT_Ciudad.SelectedValue);
        dep = int.Parse(ddt_lugarnacimDep.SelectedValue);
        if (ddt_lugarnacimDep.SelectedValue == "0" || DDT_Ciudad.SelectedValue == "0")
        {
            L_ErrorUsuario.Text = "Debe seleccionar una opcion";
        }
        else
        {
            usua.Nombre = tb_EstudianteNombre.Text;
            usua.Apellido = tb_EstudianteApellido.Text;
            usua.Rol = Convert.ToString(rol);
            usua.UserName = tb_EstudianteUsuario.Text;
            usua.Clave = tb_EstudianteContrasenia.Text;
            usua.Correo = tb_EstudianteCorreo.Text;     
            usua.Direccion = tb_EstudianteDireccion.Text;
            usua.Telefono = tb_EstudianteTelefono.Text;
            usua.Documento = tb_EstudianteId.Text;
            usua.fecha_nacimiento = fechanac.Text;
            usua.Departamento = Convert.ToString(dep);
            usua.Ciudad = Convert.ToString(ciu);
            usua.Foto = cargarImagen();
            usua.id_Acudiente = tb_id_estacu.Text;
            usua.Session = Session.SessionID;

            if (usua.Foto != null)
            {
                dat.insertarUsuarios(usua);
                this.Page.Response.Write("<script language='JavaScript'>window.alert('Administrador Insertado con Exito');</script>");

                btn_EstudianteAceptar.Visible = false;

            }
        }
        

    }

    protected void btn_EstudianteNuevo_Click(object sender, EventArgs e)
    {
        fechanac.Text = "";
        tb_EstudianteNombre.Text = "";
        tb_EstudianteApellido.Text = "";
        tb_EstudianteDireccion.Text = "";
        tb_EstudianteCorreo.Text = "";
        tb_EstudianteContrasenia.Text = "";
        tb_EstudianteUsuario.Text = "";
        tb_EstudianteTelefono.Text ="";
        tb_EstudianteId.Text ="";
        tb_EstudianteId.ReadOnly = false;
        tb_EstudianteUsuario.ReadOnly = false;
        btn_validar.Visible = true;
        btn_EstudianteNuevo.Visible = false;
        btn_EstudianteAceptar.Visible = false;
        tb_EstudianteId.Focus();
        L_ErrorUsuario.Text = "";


    }

    protected void btn_validar_Click(object sender, EventArgs e)
    {
        {

            EUser usua = new EUser();
            DaoUser dat = new DaoUser();


            usua.UserName = tb_EstudianteUsuario.Text;
            usua.Documento = tb_EstudianteId.Text;

            DataTable registros = dat.validar_usuarioadmin(usua);

            if (registros.Rows.Count > 0)
            {

                tb_Vusuario.Text = Convert.ToString(registros.Rows[0]["user_name"].ToString());
                tb_Vdocumento.Text = Convert.ToString(registros.Rows[0]["num_documento"].ToString());
                L_ErrorUsuario.Text = "El Usuario ya existe";
               

            }
            else
            {

                L_ErrorUsuario.Text = "Usuario Disponible";
                btn_EstudianteAceptar.Visible = true;
                btn_EstudianteNuevo.Visible = true;
                btn_validar.Visible = false;
                tb_EstudianteUsuario.ReadOnly = true;
                tb_EstudianteId.ReadOnly = true;

            }


        }
    }

    protected void btn_buscarAcudiente_Click(object sender, EventArgs e)
    {
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();


        usua.Documento = tb_AcudienteId.Text;

        DataTable registros = dat.obtenerAcudiente(usua);

        if (ddt_lugarnacimDep.SelectedValue == "0" || DDT_Ciudad.SelectedValue == "0")
        {
            L_ErrorUsuario.Text = "Debe seleccionar una opcion";
        }

        if (registros.Rows.Count > 0)
        {
            tb_AcudienteNombre.Text = Convert.ToString(registros.Rows[0]["nombre_usua"].ToString());
            tb_AcudienteApellido.Text = Convert.ToString(registros.Rows[0]["apellido_usua"].ToString());
            tb_id_estacu.Text = Convert.ToString(registros.Rows[0]["id_usua"].ToString());


            tb_AcudienteNombre.ReadOnly = true;
            tb_AcudienteId.ReadOnly = true;
            tb_AcudienteApellido.ReadOnly = true;
            L_ErrorAcudiente.Text = "";


            tb_EstudianteNombre.ReadOnly = false;
            tb_EstudianteApellido.ReadOnly = false;
            tb_EstudianteId.ReadOnly = false;
            tb_EstudianteDireccion.ReadOnly = false;
            tb_EstudianteTelefono.ReadOnly = false;
            tb_EstudianteUsuario.ReadOnly = false;
            tb_EstudianteContrasenia.ReadOnly = false;
            btnigm_calendar.Visible = true;
            tb_EstudianteCorreo.ReadOnly = false;
        }
        else
        {


            L_ErrorAcudiente.Text = "El Acudiente No se encuentra en la base de Datos";

        }


    }



    protected String cargarImagen()
    {
        ClientScriptManager cm = this.ClientScript;
        String nombreArchivo = System.IO.Path.GetFileName(tb_Foto.PostedFile.FileName);
        String extension = System.IO.Path.GetExtension(tb_Foto.PostedFile.FileName);
        String saveLocation = "";

        if (!(string.Compare(extension, ".png", true) == 0 || string.Compare(extension, ".jpeg", true) == 0 || string.Compare(extension, ".jpg", true) == 0))
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

        tb_Foto.PostedFile.SaveAs(saveLocation);
        cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo de imagen ha sido cargado');</script>");

        return "~/FotosUser" + "/" + nombreArchivo;
    }
}