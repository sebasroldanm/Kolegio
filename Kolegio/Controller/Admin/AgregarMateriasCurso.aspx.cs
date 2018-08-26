using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_AgregarMateriasCurso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            horario();
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
        
        //  string id = ddt_curso.SelectedValue.ToString();


       // ddt_curso.DataValueField.Insert(6, "");

        ////////////////////////////////////////////////////////////////////////////////////////////////

        //  ddt_curso.SelectedValue = Convert.ToString(registros.Rows[0]["1"].ToString());

        //  ddt_curso.SelectedValue = Convert.ToDouble(1);
        ////////////////////////////////////////////////////////////////////////////////////////////////

    }

    protected void btn_CursoMateriaAceptar_Click(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();
        string dat;

        if (ddt_curso.SelectedValue == "0" || ddt_anio.SelectedValue == "0" || ddt_Dia.SelectedValue == "0" || ddt_Docente.SelectedValue == "0" || ddt_Hora.SelectedValue == "0" || ddt_Materia.SelectedValue == "0")
        {
            L_Error.Text = "Falta seleccionar";
        }
        else
        { 
            bool ok = validar_horario();

            if (ok == true)
            {
                bool wp = validar_profesor();
                if (wp == true)
                {
                    enc.Materia = ddt_Materia.Text;

                    enc.Dia_materia = ddt_Dia.Text;
                    enc.Hora_in = ddt_Hora.Text;

                    DataTable registros = datos.obtenerHora(enc);

                    enc.Cur_mat = registros.Rows[0]["id_mf"].ToString();
                    enc.Curso = ddt_curso.Text;
                    enc.Id_docente = ddt_Docente.Text;

                    datos.insertarCursoMateria(enc);

                    int cur = Convert.ToInt32(ddt_curso.Text);
                    DataTable est = datos.gEstudiante(cur);
                    int n = est.DefaultView.Count;

                    for (int i = 0; i < n; i++)
                    {
                        enc.Id_estudiante = est.Rows[i]["id_usua"].ToString();
                        enc.Materia = ddt_Materia.SelectedValue;
                        datos.insertarNotaMateria(enc);
                    }

                    this.Page.Response.Write("<script language='JavaScript'>window.alert('Materia Insertada a Curso con Exito');</script>");
                    horario();
                }
                else
                {
                    L_Error.Text = "El docente presenta un cruce de Horarios";
                }
            }
            else
            {
                L_Error.Text = "Presenta un cruce de Horarios";
            }

        }

    }

    protected void ddt_Hora_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    public void horario()
    {
        EUser usua = new EUser();
        DaoUser dat = new DaoUser();
        string l8 = " ", m8 = " ", w8 = " ", j8 = " ", v8 = " ", l10 = " ", m10 = " ", w10 = " ", j10 = " ", v10 = " ", l12 = " ", m12 = " ", w12 = " ", j12 = " ", v12 = " ";


        int id_curso;
        id_curso = int.Parse(ddt_curso.SelectedValue);
      

        DataTable registro = dat.horarioCurso(id_curso);
        int n = registro.DefaultView.Count;
        DataSet reg = new DataSet();

        DataTable Dt = new DataTable();
        Dt.Columns.Add("      ", typeof(string));
        Dt.Columns.Add("  Lunes  ", typeof(string));
        Dt.Columns.Add("  Martes  ", typeof(string));
        Dt.Columns.Add(" Miercoles ", typeof(string));
        Dt.Columns.Add("  Jueves  ", typeof(string));
        Dt.Columns.Add("  Viernes  ", typeof(string));


        for (int i = 0; i < n; i++)
        {
            //8:00:00
            if (registro.Rows[i]["hora_inicio"].ToString() == "8:00:00" && registro.Rows[i]["dia"].ToString() == "Lunes")
            {
                l8 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "8:00:00" && registro.Rows[i]["dia"].ToString() == "Martes")
            {
                m8 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "8:00:00" && registro.Rows[i]["dia"].ToString() == "Miercoles")
            {
                w8 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "8:00:00" && registro.Rows[i]["dia"].ToString() == "Jueves")
            {
                j8 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "8:00:00" && registro.Rows[i]["dia"].ToString() == "Viernes")
            {
                v8 = registro.Rows[i]["nombre_materia"].ToString();
            }

            //10:00:00
            if (registro.Rows[i]["hora_inicio"].ToString() == "10:00:00" && registro.Rows[i]["dia"].ToString() == "Lunes")
            {
                l10 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "10:00:00" && registro.Rows[i]["dia"].ToString() == "Martes")
            {
                m10 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "10:00:00" && registro.Rows[i]["dia"].ToString() == "Miercoles")
            {
                w10 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "10:00:00" && registro.Rows[i]["dia"].ToString() == "Jueves")
            {
                j10 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "10:00:00" && registro.Rows[i]["dia"].ToString() == "Viernes")
            {
                v10 = registro.Rows[i]["nombre_materia"].ToString();
            }

            //12:00:00
            if (registro.Rows[i]["hora_inicio"].ToString() == "12:00:00" && registro.Rows[i]["dia"].ToString() == "Lunes")
            {
                l12 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "12:00:00" && registro.Rows[i]["dia"].ToString() == "Martes")
            {
                m12 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "12:00:00" && registro.Rows[i]["dia"].ToString() == "Miercoles")
            {
                w12 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "12:00:00" && registro.Rows[i]["dia"].ToString() == "Jueves")
            {
                j12 = registro.Rows[i]["nombre_materia"].ToString();
            }

            if (registro.Rows[i]["hora_inicio"].ToString() == "12:00:00" && registro.Rows[i]["dia"].ToString() == "Viernes")
            {
                v12 = registro.Rows[i]["nombre_materia"].ToString();
            }
        }
        Dt.Rows.Add(" 8:00:00-9:29:00 ", l8, m8, w8, j8, v8);
        Dt.Rows.Add(" 09:30:00-9:59:00 ", "  L  ", "  I  ", " B ", "  R  ", "  E ");
        Dt.Rows.Add(" 10:00:00-11:59:00", l10, m10, w10, j10, v10);
        Dt.Rows.Add(" 12:00:00-2:00:00", l12, m12, w12, j12, v12);

        
        GridView1.DataSource = Dt;
        GridView1.DataBind();

    }

    protected void btn_agregam_Click(object sender, EventArgs e)
    {


        EUser usua = new EUser();
        DaoUser dat = new DaoUser();
        bool ok = validar_mat();

        if (ok == false)
        {
            usua.Materia = tb_materia.Text;
            usua.Session = Session.SessionID;
            dat.insertarMateria(usua);
            this.Page.Response.Write("<script language='JavaScript'>window.alert('Materia Insertada con Exito');</script>");

        }
        else
        {
            L_Error.Text = "La Materia ya se encuentra en nuestra Base de Datos";
        }    
    }
    

    public bool validar_materia()
    {
        DaoUser datos = new DaoUser();

        bool ok = true;
        DataTable mat = datos.obtenerMateria();
        int n = mat.DefaultView.Count;
        for (int i = 0; i < n; i++)
        {
            if ((mat.Rows[i]["nombre_materia"].ToString() == tb_materia.Text))
            {
                return false;
            }
            else
            {
                ok = true;
            }
        }
        return ok;
    }



    public bool validar_mat()
    {
        DaoUser datos = new DaoUser();

        bool ok = true;
        string matic = tb_materia.Text;
        DataTable mat = datos.validaMateria(matic);

        if (mat.Rows.Count > 0)
        {
            ok = true;
        }
        else
        {
            ok = false;
        }

        return ok;
    }



    public bool validar_horario()
    {
        DaoUser datos = new DaoUser();
        String id = ddt_curso.SelectedValue.ToString();
        int g = int.Parse(id);
        bool ok = true;
        DataTable mat = datos.horarioCurso(g);
        int n = mat.DefaultView.Count;
        for (int i = 0; i < n; i++)
        {
            if ((mat.Rows[i]["dia"].ToString() == ddt_Dia.SelectedValue) & (mat.Rows[i]["hora_inicio"].ToString() == ddt_Hora.SelectedValue))
            {
                return false;
            }
            else
            {
                ok = true;
            }
        }
        return ok;
    }

    public bool validar_profesor()
    {
        DaoUser datos = new DaoUser();
        String id = ddt_Docente.SelectedValue.ToString();
        bool ok = true;
        DataTable mat = datos.horarioProf(id);
        int n = mat.DefaultView.Count;
        for (int i = 0; i < n; i++)
        {
            if ((mat.Rows[i]["dia"].ToString() == ddt_Dia.SelectedValue) & (mat.Rows[i]["hora_inicio"].ToString() == ddt_Hora.SelectedValue))
            {
                return false;
            }
            else
            {
                ok = true;
            }
        }
        return ok;
    }


    protected void btn_pasaranio_Click(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();
        datos.insertar_Año();

        DataTable reg = datos.obtienePromedio();
        int n = reg.DefaultView.Count;

        for (int i = 0; i < n; i++)
        {
            int a = Convert.ToInt32(reg.Rows[i]["nombre_curso"]);
            double b = Convert.ToDouble(reg.Rows[i]["notadef"]);
            if ((Convert.ToInt32(reg.Rows[i]["nombre_curso"]) > 1100) & (Convert.ToDouble(reg.Rows[i]["notadef"]) >= 30.0))
            {
                enc.Id_estudiante = reg.Rows[i]["id_usua"].ToString();
                //update
                datos.editarOnce(enc);

            }
        }
        DataTable ultaño = datos.obtenerUltimoAño();
        enc.Año = ultaño.Rows[0]["id_anio"].ToString();

        DataTable registro = datos.obtienePromedio();
        n = registro.DefaultView.Count;

        for (int i = 0; i < n; i++)
        {
            if (Convert.ToDouble(registro.Rows[i]["notadef"]) >= 30.0)
            {
                int curso = Convert.ToInt32(registro.Rows[i]["nombre_curso"]);
                enc.Id_estudiante = registro.Rows[i]["id_usua"].ToString();
                curso = curso + 100;
                enc.Curso = curso.ToString();
                DataTable idcurso = datos.obteneridCurso(enc);
                enc.Curso = idcurso.Rows[0]["id_ancu"].ToString();
                datos.insertarEstudianteCurso(enc);
            }
            else
            {
                int curso = Convert.ToInt32(registro.Rows[i]["nombre_curso"]);
                enc.Id_estudiante = registro.Rows[i]["id_usua"].ToString();
                curso = curso;
                enc.Curso = curso.ToString();
                DataTable idcurso = datos.obteneridCurso(enc);
                enc.Curso = idcurso.Rows[0]["id_ancu"].ToString();
                datos.insertarEstudianteCurso(enc);
            }
        }
        this.Page.Response.Write("<script language='JavaScript'>window.alert('Se ha migraido de año con Exito');</script>");

    }
}
