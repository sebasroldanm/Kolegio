using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using Newtonsoft;
using Npgsql;
using NpgsqlTypes;

/// <summary>
/// Descripción breve de DaoUser
/// </summary>
public class DaoUser
{
    public DaoUser()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    //** LOGIN - RECUPERAR CONTRASENIA  ** LOGIN - RECUPERAR CONTRASENIA** LOGIN - RECUPERAR CONTRASENIA** LOGIN - RECUPERAR CONTRASENIA

    public DataTable loggin(EUser enc)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_loggin", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = enc.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Text).Value = enc.Clave;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }


    

    public DataTable almacenarToken(String token, Int32 userId)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_almacenar_token", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_token", NpgsqlDbType.Text).Value = token;
            dataAdapter.SelectCommand.Parameters.Add("_id_usuario", NpgsqlDbType.Integer).Value = userId;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    public DataTable generarToken(String user_name)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_validar_usuario_t", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = user_name;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }



    public DataTable actualziarContrasena(EUserContrasenia datos)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_actualizar_contrasenia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_user_id", NpgsqlDbType.Integer).Value = datos.UserId;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = datos.Clave;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    public DataTable obtenerUsusarioToken(String token)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_usuario_token", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_token", NpgsqlDbType.Text).Value = token;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    //** FIN - LOGIN - RECUPERAR CONTRASENIA  ** FIN - LOGIN - RECUPERAR CONTRASENIA ** FIN - LOGIN - RECUPERAR CONTRASENIA

    public DataTable insertarUsuarios(EUser dat)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insertar_usuarios", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_usua",NpgsqlDbType.Varchar, 100).Value = dat.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_rol_id", NpgsqlDbType.Integer).Value = dat.Rol;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = dat.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Text).Value = dat.Clave;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 100).Value = dat.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_apellido_usua", NpgsqlDbType.Varchar, 100).Value = dat.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Varchar, 100).Value = dat.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 100).Value = dat.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = dat.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_foto_usua", NpgsqlDbType.Varchar, 100).Value = dat.Foto;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_nac", NpgsqlDbType.Varchar, 100).Value = dat.fecha_nacimiento;
            dataAdapter.SelectCommand.Parameters.Add("_dep_nacimiento", NpgsqlDbType.Integer).Value = dat.Departamento;
            dataAdapter.SelectCommand.Parameters.Add("_ciu_nacimiento", NpgsqlDbType.Integer).Value = dat.Ciudad;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = dat.Session;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }

    
    public DataTable departamento()
    {
        DataTable Dep = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("lugares.f_obtener_departamento", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Dep);
           
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Dep;
    }

    public DataTable ciudad(int idDepart)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("lugares.f_obtener_ciudad", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_c_depart", NpgsqlDbType.Integer).Value = idDepart;
            
            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }

    


         public DataTable obtenerAcudiente(EUser dat)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_acudiente", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = dat.Documento;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }








    public DataTable obtenerUsuarioMod(EUser dat) 
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_modusua", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = dat.Documento;
          
            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }


    public DataTable EditarUsuario( EUser datos)
    {
        DataTable EdUsua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_editar_usuarios", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_usua", NpgsqlDbType.Varchar, 100).Value = datos.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_rol_id", NpgsqlDbType.Integer).Value = datos.Rol;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = datos.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Text).Value = datos.Clave;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 100).Value = datos.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Boolean).Value = datos.Estado;
            dataAdapter.SelectCommand.Parameters.Add("_apellido_usua", NpgsqlDbType.Varchar, 100).Value = datos.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Varchar, 100).Value = datos.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 100).Value = datos.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = datos.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_foto_usua", NpgsqlDbType.Varchar, 100).Value = datos.Foto;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_nac", NpgsqlDbType.Varchar, 100).Value = datos.fecha_nacimiento;
            dataAdapter.SelectCommand.Parameters.Add("_dep_nacimiento", NpgsqlDbType.Integer).Value = datos.Departamento;
            dataAdapter.SelectCommand.Parameters.Add("_ciu_nacimiento", NpgsqlDbType.Integer).Value = datos.Ciudad;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = datos.Session;

            conection.Open();
            dataAdapter.Fill(EdUsua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return EdUsua;




    }




    public DataTable traerEstudiante (EUser datos)
    {
        DataTable traerest = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_traer_estudiante", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_usua", NpgsqlDbType.Varchar, 100).Value = datos.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido_usua", NpgsqlDbType.Varchar, 100).Value = datos.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = datos.Documento;


            conection.Open();
            dataAdapter.Fill(traerest);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return traerest;




    }





    public DataTable insertarEstudiante (EUser dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insertar_estudiante", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_usua", NpgsqlDbType.Varchar, 100).Value = dat.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_rol_id", NpgsqlDbType.Integer).Value = dat.Rol;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = dat.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Text).Value = dat.Clave;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 100).Value = dat.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_apellido_usua", NpgsqlDbType.Varchar, 100).Value = dat.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Varchar, 100).Value = dat.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 100).Value = dat.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = dat.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_foto_usua", NpgsqlDbType.Varchar, 100).Value = dat.Foto;
            dataAdapter.SelectCommand.Parameters.Add("_id_acudiente", NpgsqlDbType.Integer).Value = dat.id_Acudiente;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_nac", NpgsqlDbType.Varchar, 100).Value = dat.fecha_nacimiento;
            dataAdapter.SelectCommand.Parameters.Add("_dep_nacimiento", NpgsqlDbType.Integer).Value = dat.Departamento;
            dataAdapter.SelectCommand.Parameters.Add("_ciu_nacimiento", NpgsqlDbType.Integer).Value = dat.Ciudad;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }




    public DataTable listarusuario ()
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_usuarios", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }


    public DataTable listaracudiente()
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_acudientes", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }


    public DataTable listarestudiante()
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_estudiantes", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }



    public DataTable listardocente()
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_docente", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }

    public DataTable curso()
    {
        DataTable Cur = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_curso", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Cur);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Cur;
    }

    public DataTable cursoProfesor(string id_p, string anio)
    {
        DataTable Cur = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_curso_profesor", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_cm_profesor", NpgsqlDbType.Integer).Value = int.Parse(id_p);
            dataAdapt.SelectCommand.Parameters.Add("_id_anio", NpgsqlDbType.Integer).Value = int.Parse(anio);

            conection.Open();
            dataAdapt.Fill(Cur);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Cur;
    }

    public DataTable gEstudiante(int curs)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_estudiante", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_curso", NpgsqlDbType.Integer).Value = curs;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }






    public DataTable validar_usuarioadmin(EUser dat)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_valida_admin", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = dat.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", NpgsqlDbType.Integer).Value = dat.Documento;



            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;




    }


    public DataTable editarConfig(EUser dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_editar_configUsuario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = dat.Id_estudiante;
            dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Text).Value = dat.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Text).Value = dat.Clave;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 100).Value = dat.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_foto_usua", NpgsqlDbType.Varchar, 100).Value = dat.Foto;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = dat.Session;


            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }


    public DataTable horario(String id)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_horario_est", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = id;


            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    public DataTable horarioProf(String id)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("SELECT nombre_materia, dia,hora_inicio, hora_fin FROM usuario.usuario, registro.estudiante_curso, registro.anio_curso, registro.curso_materia, registro.materia_fecha, registro.dia_materia, registro.materia WHERE usuario.id_usua = estudiante_curso.id_ec_estudiante AND anio_curso.id_ancu = estudiante_curso.id_ec_curso AND curso_materia.id_cm_curso = anio_curso.id_ancu AND materia_fecha.id_mf = curso_materia.id_cm_materia AND materia_fecha.id_mf_materia = materia.id_materia AND materia_fecha.id_mf_fecha = dia_materia.id_dia_materia AND usuario.id_usua = '" + id + "';", conection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_horario_prof", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    public DataTable listarObservador(string dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_observador", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estudiante", NpgsqlDbType.Integer).Value = dat;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable insertarObservacion(EUser dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_insertar_observacion", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_observacion", NpgsqlDbType.Varchar, 100).Value = dat.Observacion;
            dataAdapter.SelectCommand.Parameters.Add("_id_estudiante", NpgsqlDbType.Integer).Value = dat.Id_estudiante;


            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }


    public DataTable obtenerMateria()
    {
        DataTable Dep = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_materia", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Dep);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Dep;
    }

    public DataTable obtenerDiaHora(int mater)
    {
        DataTable Dep = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_diahora", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_materia", NpgsqlDbType.Integer).Value = mater;

            conection.Open();
            dataAdapt.Fill(Dep);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Dep;
    }

    public DataTable obtenerDia()
    {
        DataTable Dep = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_dia", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Dep);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Dep;
    }

    public DataTable obtenerHora(EUser reg)
    {
        DataTable Dep = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_hora", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_materia", NpgsqlDbType.Integer).Value = reg.Materia;
            dataAdapt.SelectCommand.Parameters.Add("_dia", NpgsqlDbType.Varchar, 100).Value = reg.Dia_materia;
            dataAdapt.SelectCommand.Parameters.Add("_hora_inicio", NpgsqlDbType.Varchar, 100).Value = reg.Hora_in;

            conection.Open();
            dataAdapt.Fill(Dep);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Dep;
    }

    public DataTable insertarCursoMateria(EUser dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_insertar_cur_mat", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_cm_materia", NpgsqlDbType.Integer).Value = dat.Cur_mat;
            dataAdapter.SelectCommand.Parameters.Add("_id_cm_curso", NpgsqlDbType.Integer).Value = dat.Curso;
            dataAdapter.SelectCommand.Parameters.Add("_id_cm_profesor", NpgsqlDbType.Integer).Value = dat.Id_docente;


            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable obtenerAnio()
    {
        DataTable Anio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_anio", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Anio);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Anio;
    }







    ////////////////////BOLETIN ESTUDIANTE////////////////////////////////////////////////////

    public DataTable BoletinEstudiante(string dat, String dat2)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_traer_boletin", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = dat;
            dataAdapter.SelectCommand.Parameters.Add("_id_ancu", NpgsqlDbType.Integer).Value = dat2;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable guardadoSession(EUser datos)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("security.f_guardado_session", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_user_id", NpgsqlDbType.Integer).Value = datos.Id_estudiante;
            dataAdapter.SelectCommand.Parameters.Add("_ip", NpgsqlDbType.Varchar, 100).Value = datos.Ip;
            dataAdapter.SelectCommand.Parameters.Add("_mac", NpgsqlDbType.Varchar, 100).Value = datos.Mac;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = datos.Session;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    public DataTable cerrarSession(EUser datos)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("security.f_cerrar_session", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = datos.Session;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    //** ENVIO MENSAJE CORREO - ** ENVIO MENSAJE CORREO - ** ENVIO MENSAJE CORREO - ** ENVIO MENSAJE CORREO - ** ENVIO MENSAJE CORREO 


    public DataTable verificarCorreo(EUser enc)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_verificar_correo", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = enc.Correo;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    //** FIN ENVIO MENSAJE CORREO - ** FIN ENVIO MENSAJE CORREO - ** FIN ENVIO MENSAJE CORREO - ** FIN ENVIO MENSAJE CORREO

    public DataTable obtenerCursoanio(int anio)
    {
        DataTable Cur = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_cursoanio", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_anio", NpgsqlDbType.Integer).Value = anio;

            conection.Open();
            dataAdapt.Fill(Cur);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Cur;
    }


    public DataTable horarioCurso(int id)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_horario_cur", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_ancu", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }



    public DataTable insertarMateria(EUser dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_insertar_materia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_materia", NpgsqlDbType.Varchar, 100).Value = dat.Materia;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = dat.Session;
            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable listaestsincurso()
    {
        DataTable est = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_estudiantes_sincurso", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
   
            conection.Open();
            dataAdapt.Fill(est);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return est;
    }


    public DataTable obtenerAniodeCurso(string anio)
    {
        DataTable Cur = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_anio_de_curso", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_nombre_anio", NpgsqlDbType.Varchar,100).Value = anio;


            conection.Open();
            dataAdapt.Fill(Cur);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Cur;
    }

    public DataTable obtener_MatCur(EUser reg)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_materia_curso", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_curso", NpgsqlDbType.Integer).Value = reg.Curso;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }

    public DataTable obtenermateriadecurso(int reg)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_materia_curso", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_curso", NpgsqlDbType.Integer).Value = reg;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }


    ////////////////LISTAR ADMINISTRADORES EN CRYSTAL////////////////////////

    public DataTable obtenerAdministradores()
    {
        DataTable Administrador = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_administradores", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
     

            conection.Open();
            dataAdapter.Fill(Administrador);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Administrador;
    }

    ////////////////////////CERTIFICADO DE ESTUDIO CRYSTAL////////////////////////////////


    public DataTable obtenerCertificadoEst(String reg)
    {
        DataTable estudiante = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("usuario.f_obtener_estudiante", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = reg;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(estudiante);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return estudiante;
    }


    public DataTable insertarNotaMateria(EUser dat)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_insertar_nota_est", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estudiante", NpgsqlDbType.Integer).Value = dat.Id_estudiante;
            dataAdapter.SelectCommand.Parameters.Add("_id_n_materia", NpgsqlDbType.Integer).Value = dat.Materia;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }



    public DataTable insertarEstudianteCurso(EUser dat)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_insertar_est_curso", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_ec_estudiante", NpgsqlDbType.Integer).Value = dat.Id_estudiante;
            dataAdapter.SelectCommand.Parameters.Add("_id_ec_curso", NpgsqlDbType.Integer).Value = dat.Curso;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }


    public DataTable obtenertodosAnio()
    {
        DataTable Anio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_todos_anios", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Anio);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Anio;
    }


    public DataTable obtienePromedio()
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_promedio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable editarOnce(EUser dat)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("usuario.f_editar_once", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = dat.Id_estudiante;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }

    public DataTable obteneridCurso(EUser dat)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_id_curso", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_curso", NpgsqlDbType.Varchar, 100).Value = dat.Curso;
            dataAdapter.SelectCommand.Parameters.Add("_id_anio", NpgsqlDbType.Integer).Value = dat.Año;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }

    public DataTable obtenerUltimoAño()
    {
        DataTable Anio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_ultimo_anio", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(Anio);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Anio;
    }


    public DataTable insertar_Año()
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_insertar_anio_curso", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }



    public DataTable obtenermateriacurso(string Curso, string Prof)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_materia_curso_pro", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_curso", NpgsqlDbType.Integer).Value = int.Parse(Curso);
            dataAdapt.SelectCommand.Parameters.Add("_id_cm_profesor", NpgsqlDbType.Integer).Value = int.Parse(Prof);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }

    public DataTable obtenerNota(EUser dat)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_nota", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = dat.Id_estudiante;
            dataAdapt.SelectCommand.Parameters.Add("_id_ancu", NpgsqlDbType.Integer).Value = dat.Curso;
            dataAdapt.SelectCommand.Parameters.Add("_id_materia", NpgsqlDbType.Integer).Value = dat.Materia;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }

    public DataTable insertarNota(EUser dat)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_editar_nota", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_nota", NpgsqlDbType.Integer).Value = dat.IdNota;
            dataAdapt.SelectCommand.Parameters.Add("_nota1", NpgsqlDbType.Double).Value = dat.Nota1;
            dataAdapt.SelectCommand.Parameters.Add("_nota2", NpgsqlDbType.Double).Value = dat.Nota2;
            dataAdapt.SelectCommand.Parameters.Add("_nota3", NpgsqlDbType.Double).Value = dat.Nota3;
            dataAdapt.SelectCommand.Parameters.Add("_notadef", NpgsqlDbType.Double).Value = dat.Notadef;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }

    public DataTable obtenerEstApel(int curs)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_obtener_estudiante_apellido", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_curso", NpgsqlDbType.Integer).Value = curs;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }
    


    public DataTable obtenerCursoEst(EUser dat)
    {
        DataTable An = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("registro.f_obtener_curso_de_est", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_ec_estudiante", NpgsqlDbType.Integer).Value = dat.Id_estudiante;
            dataAdapt.SelectCommand.Parameters.Add("_id_anio", NpgsqlDbType.Integer).Value = dat.Año;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(An);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return An;
    }

    public DataTable obtenerBoletin(string usu, string ancu)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_traer_boletin", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = usu;
            dataAdapter.SelectCommand.Parameters.Add("_id_ancu", NpgsqlDbType.Integer).Value = ancu;
            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable incio()
    {
        DataTable In = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("inicio.f_obtener_valores", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(In);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return In;
    }

    public DataTable editarInicio(EUser datos)
    {
        DataTable inicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("inicio.f_editar_inicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_inicio_cont", NpgsqlDbType.Text).Value = datos.Inicio;
            dataAdapter.SelectCommand.Parameters.Add("_mision_inicio", NpgsqlDbType.Text).Value = datos.Mision;
            dataAdapter.SelectCommand.Parameters.Add("_vision_inicio", NpgsqlDbType.Text).Value = datos.Vision;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = datos.Session;


            conection.Open();
            dataAdapter.Fill(inicio);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return inicio;

    }

    public DataTable acudientemensaje(int acu)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_acudiente_mensaje", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = acu;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }

    public DataTable profemensaje(int id_usua)
    {
        DataTable ProMen = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("usuario.f_listar_profesor_mensaje", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = id_usua;
            conection.Open();
            dataAdapt.Fill(ProMen);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return ProMen;
    }

    public DataTable obtener_est_acu(int id_usua)
    {
        DataTable obtener = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("usuario.f_obtener_est_acu", conection);
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapt.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = id_usua;
            conection.Open();
            dataAdapt.Fill(obtener);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return obtener;
    }

    public DataTable listarEstAcudiente(string usu)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_est_acudiente", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_ac_acudiente", NpgsqlDbType.Integer).Value = usu;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable comparaFecha()
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("tiempo.f_compara_fecha", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable editaBool(bool ok)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("tiempo.f_edita_bool", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_ok", NpgsqlDbType.Boolean).Value = ok;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable editaFinaño(EUser enc)
    {
        DataTable usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("tiempo.f_editar_finanio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_fin_anio", NpgsqlDbType.Varchar).Value = enc.Año;

            conection.Open();
            dataAdapter.Fill(usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usua;
    }

    public DataTable listardocenteddl()
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_listar_docente_ddl", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }


    public DataTable validaMateria(string mat)
    {
        DataTable Usua = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("registro.f_valida_materia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre_materia", NpgsqlDbType.Varchar).Value = mat;

            conection.Open();
            dataAdapter.Fill(Usua);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usua;
    }

    ////////////////////////CERTIFICADO DE PROFESOR CRYSTAL////////////////////////////////


    public DataTable obtenerCertificadoProf(String reg)
    {
        DataTable estudiante = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapt = new NpgsqlDataAdapter("usuario.f_obtener_Profesorcrys", conection);
            dataAdapt.SelectCommand.Parameters.Add("_id_usua", NpgsqlDbType.Integer).Value = reg;
            dataAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapt.Fill(estudiante);

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return estudiante;
    }

    
    public DataTable obtenerprofesores()
    {
        DataTable Administrador = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_profesores", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Administrador);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Administrador;
    }



    public DataTable obteneracudientes()
    {
        DataTable Administrador = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_acudientes", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Administrador);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Administrador;
    }



}


