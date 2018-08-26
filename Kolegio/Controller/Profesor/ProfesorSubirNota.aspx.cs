using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Profesor_ProfesorSubirNota : System.Web.UI.Page
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
        }
        else
            Response.Redirect("/View/Acudiente/AccesoDenegado.aspx");
        
    }

    protected void ddt_curso_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btn_Subirnota_Click(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();

        enc.Id_estudiante = ddl_alumno.SelectedValue;
        enc.Materia = ddl_materia.SelectedValue;
        enc.Curso = ddt_curso.SelectedValue;
        DataTable registros = datos.obtenerNota(enc);

        enc.IdNota = registros.Rows[0]["id_nota"].ToString();
        Double n1 = Convert.ToDouble(tb_nt.Text);
        Double n2 = Convert.ToDouble(tb_nt2.Text);
        Double n3 = Convert.ToDouble(tb_nt3.Text);

        Double nd = (n1 + n2 + n3) / 3.0;

        enc.Nota1 = n1.ToString();
        enc.Nota2 = n2.ToString();
        enc.Nota3 = n3.ToString();
        
        enc.Notadef = nd.ToString();
        tb_denifitiva.Text = nd.ToString();

        datos.insertarNota(enc);
    }

    protected void ButtonVerNota_Click(object sender, EventArgs e)
    {
        DaoUser datos = new DaoUser();
        EUser enc = new EUser();

        enc.Id_estudiante = ddl_alumno.SelectedValue;
        enc.Materia = ddl_materia.SelectedValue;
        enc.Curso = ddt_curso.SelectedValue;
        DataTable registros =  datos.obtenerNota(enc);

        tb_nt.Text = registros.Rows[0]["nota1"].ToString();
        tb_nt2.Text =  registros.Rows[0]["nota2"].ToString(); 
        tb_nt3.Text = registros.Rows[0]["nota3"].ToString();

        tb_denifitiva.Text = registros.Rows[0]["notadef"].ToString();

    }
}