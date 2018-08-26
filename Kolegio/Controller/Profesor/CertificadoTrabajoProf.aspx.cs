using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Profesor_CertificadoTrabajoProf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            try
            {
                InfReporte reporte = ObtenerInforme();
                CRS_certProf.ReportDocument.SetDataSource(reporte);
                CrystalReportViewer1.ReportSource = CRS_certProf;
            }
            catch (Exception)
            {

                throw;
            }
        }
        else
            Response.Redirect("AccesoDenegado.aspx");


    }


    protected InfReporte ObtenerInforme()
    {


        String reg = Session["userId"].ToString();

        DataRow fila;
        DataTable informacion = new DataTable();
        InfReporte datos = new InfReporte();

        informacion = datos.Tables["ProfesorCert"]; // nombre de la tabla que cree en crystal en el InfReporte.xsd


        DaoUser estudiante = new DaoUser();

        DataTable Intermedio = estudiante.obtenerCertificadoProf(reg);


        for (int i = 0; i < Intermedio.Rows.Count; i++)
        {

            fila = informacion.NewRow();
            ///El primero [""]  es como se llama el campo de la tabla de crystal y el segundo [""] el campo de la tabla en postgres
            fila["Apellido"] = Intermedio.Rows[i]["apellido_usua"].ToString();
            fila["Nombre"] = Intermedio.Rows[i]["nombre_usua"].ToString();
            fila["Documento"] = int.Parse(Intermedio.Rows[i]["num_documento"].ToString());


            informacion.Rows.Add(fila);
        }
        return datos;
    }





    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }
}