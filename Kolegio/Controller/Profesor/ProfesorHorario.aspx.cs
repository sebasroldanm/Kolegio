using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class View_Profesor_ProfesorHorario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            EUser usua = new EUser();
            DaoUser dat = new DaoUser();
            string l8 = " ", m8 = " ", w8 = " ", j8 = " ", v8 = " ";
            //   string l9 = " ", m9 = " ", w9 = " ", j9 = " ", v9 = " ";
            string l10 = " ", m10 = " ", w10 = " ", j10 = " ", v10 = " ";
            string l12 = " ", m12 = " ", w12 = " ", j12 = " ", v12 = " ";

            String id_est = Session["userId"].ToString();
            DataTable registro = dat.horarioProf(id_est);
            int n = registro.DefaultView.Count;
            DataSet reg = new DataSet();
            //reg.Tables.Add(registro);
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
            Dt.Rows.Add(" 09:30:00-9:59:00 ", "  R  ", "  E  ", "  C   E ", "  S  ", "  O ");
            Dt.Rows.Add(" 10:00:00-11:59:00", l10, m10, w10, j10, v10);
            Dt.Rows.Add(" 12:00:00-2:00:00", l12, m12, w12, j12, v12);
            /*
            Dt.Rows.Add(" 8:00:00 ", " ", " Sociales ", " ", " ", " ");
            Dt.Rows.Add(" 09:30:00 ", " ", " ", " Matematicas ", " ", " ");
            Dt.Rows.Add(" 10:00:00 ", " ", " ", " ", " ", " ");
            Dt.Rows.Add(" 12:00:00 ", "  Sociales", "  ", " ", " ", " ");
            */

            GridView1.DataSource = Dt;
            GridView1.DataBind();
            //GridViewhora.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;



            //GridViewhora.DataSource = registro;
            //GridViewhora.DataBind();
        }
        else
            Response.Redirect("AccesoDenegado.aspx");

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btn_descargar_Click(object sender, EventArgs e)
    {
        Page.RegisterStartupScript("script", "<script>window.open('/View/Profesor/CertificadoTrabajoProf.aspx' ,'Descargar','height=300', 'width=300')</script>");

    }
}

