using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Inicio_InicioNosotros : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session["userId"] = null;
        Session["nombre"] = null;

        DaoUser user = new DaoUser();
        EUser dat = new EUser();
        dat.Session = Session.SessionID;
        user.cerrarSession(dat);


        DataTable regi = user.incio();

        if (regi.Rows.Count > 0)
        {
            L_Inicio.Text = Convert.ToString(regi.Rows[0]["inicio_cont"].ToString());
        }

        DaoUser datos = new DaoUser();
        EUser enc = new EUser();

        DataTable dati = datos.comparaFecha();

        if (dati.Rows.Count > 0)
        {
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
                    enc.Curso = curso.ToString();
                    DataTable idcurso = datos.obteneridCurso(enc);
                    enc.Curso = idcurso.Rows[0]["id_ancu"].ToString();
                    datos.insertarEstudianteCurso(enc);
                }
            }

            bool ok = false;
            datos.editaBool(ok);
            this.Page.Response.Write("<script language='JavaScript'>window.alert('Se ha migrado de año con Exito');</script>");

        }


    }
}