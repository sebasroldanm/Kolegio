using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Utilitarios;
using System.Data;

namespace Logica
{
    public  class LUser
    {
        public UUser loggear(string userName, string clave)
        {
            UUser user = new UUser();
            DUser datos = new DUser();

            user.UserName = userName;
            user.Clave = clave;

            user.Mensaje = "";

            DataTable resultado = datos.loggin(user);

            if (resultado.Rows.Count > 0)
            {
                user.SUserId = resultado.Rows[0]["id_usua"].ToString();
                user.SUserName = resultado.Rows[0]["user_name"].ToString();
                user.SNombre = resultado.Rows[0]["nombre_usua"].ToString();
                user.SApellido = resultado.Rows[0]["apellido_usua"].ToString();
                user.SClave = resultado.Rows[0]["clave"].ToString();
                user.SCorreo = resultado.Rows[0]["correo"].ToString();
                user.SDocumento = resultado.Rows[0]["num_documento"].ToString();
                user.SFoto = resultado.Rows[0]["foto_usua"].ToString();

                if ((resultado.Rows[0]["estado"].ToString()) == "True")
                {
                    switch (int.Parse(resultado.Rows[0]["rol_id"].ToString()))
                    {
                        case 1:
                            //Response.Redirect("Admin/AgregarAdministrador.aspx");
                            user.Url = "~/View/Admin/AgregarAdministrador.aspx";
                            break;

                        case 2:
                            //Response.Redirect("Profesor/ProfesorSubirNota.aspx");
                            user.Url = "~/View/Profesor/ProfesorSubirNota.aspx";
                            break;

                        case 3:
                            //Response.Redirect("Estudiante/EstudianteHorario.aspx");
                            user.Url = "~/View/Estudiante/EstudianteHorario.aspx";
                            break;

                        case 4:
                            //Response.Redirect("Acudiente/AcudienteBoletin.aspx");
                            user.Url = "~/View/Acudiente/AcudienteBoletin.aspx";
                            break;

                        default:
                            //Response.Redirect("Loggin.aspx");
                            user.Url = "~/View/Loggin.aspx";
                            break;
                    }

                }
                else
                {
                    //L_Error.Text = "Usuario Se Encuentra Inactivo";
                    user.Mensaje = "Usuario Se Encuentra Inactivo";
                    //Session["userId"] = null;
                    user.SUserId = null;
                }
            }
            else
            {
                //L_Error.Text = "Usuario Y/o Clave Incorrecto";
                user.Mensaje = "Usuario Y/o Clave Incorrecto";
                //Session["userId"] = null;
                user.SUserId = null;
            }
            return user;
        }

    }
}
