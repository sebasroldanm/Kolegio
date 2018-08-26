using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_AgregarEstudiantesCurso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            Console.WriteLine("");
        }
        else
            Response.Redirect("AccesoDenegado.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddt_curso.SelectedValue == "0")
        {
            L_ErrorUsuario.Text = "Debe Elegir un Curso";
        }
        else
        {

            DaoUser datos = new DaoUser();
            EUser enc = new EUser();

            enc.Documento = GridView1.SelectedRow.Cells[0].Text;
            DataTable reg = datos.obtenerUsuarioMod(enc);

            enc.Id_estudiante = reg.Rows[0]["id_usua"].ToString();
            enc.Curso = ddt_curso.SelectedValue;
            datos.insertarEstudianteCurso(enc);

            DataTable materias = datos.obtener_MatCur(enc);
            int n = materias.DefaultView.Count;

            for (int i = 0; i < n; i++)
            {
                enc.Materia = materias.Rows[i]["id_materia"].ToString();
                datos.insertarNotaMateria(enc);

            }

            GridView1.DataBind();
            L_ErrorUsuario.Text = "";
        }




    }

    protected void btn_Aceptar_Click(object sender, EventArgs e)
    {


        if (ddt_curso.SelectedValue == "0" || ddt_curso.SelectedValue == "0")
        {
            L_ErrorUsuario.Text = "Debe Elegir un Curso";
        }
        else
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox ch = (CheckBox)GridView1.Rows[i].FindControl("CBest");
                Label lb = (Label)GridView1.Rows[i].FindControl("label1");
                if (ch.Checked == true)
                {

                    DaoUser datos = new DaoUser();
                    EUser enc = new EUser();
                    enc.Documento = lb.Text;
                    DataTable reg = datos.obtenerUsuarioMod(enc);

                    enc.Id_estudiante = reg.Rows[0]["id_usua"].ToString();
                    enc.Curso = ddt_curso.SelectedValue;
                    datos.insertarEstudianteCurso(enc);

                    DataTable materias = datos.obtener_MatCur(enc);
                    int n = materias.DefaultView.Count;

                    for (int k = 0; k < n; k++)
                    {
                        enc.Materia = materias.Rows[k]["id_materia"].ToString();
                        datos.insertarNotaMateria(enc);

                    }

                    //L_ErrorUsuario.Text = "Debe Elegir un Curso";
                    L_OkUsuario.Text = "Estudiantes Agregados al curso";
                    GridView1.DataBind();

                }
            }

        }
    }

}

