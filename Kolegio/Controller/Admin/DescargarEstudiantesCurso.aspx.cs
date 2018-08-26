using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_DescargarEstudiantesCurso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            try
            {
                InfReporte reporte = ObtenerInforme();
                CRS_listaestcur.ReportDocument.SetDataSource(reporte);
                CrystalReportViewer1.ReportSource = CRS_listaestcur;
            }
            catch (Exception)
            {

                throw;
            }
     
    }

    protected InfReporte ObtenerInforme()
    {

        DataRow fila;
        DataTable informacion = new DataTable();
        InfReporte datos = new InfReporte();

        int curs;
        curs = Convert.ToInt16(Session["Cursoestu"]);

        informacion = datos.Tables["EstudianteCurso"]; // nombre de la tabla que cree en crystal en el InfReporte.xsd

        DaoUser profesor = new DaoUser();

        DataTable Intermedio = profesor.gEstudiante(curs);


        for (int i = 0; i < Intermedio.Rows.Count; i++) // for para llenar la lista con cada usurario
                                                        //// si es solo un dato como con el certificado de estudio, no se hace el for
        {

            fila = informacion.NewRow();
            ///El primero [""]  es como se llama el campo de la tabla de crystal y el segundo [""] el campo de la tabla en postgres
            fila["Apellido"] = Intermedio.Rows[i]["apellido_usua"].ToString();
            fila["Nombre"] = Intermedio.Rows[i]["nombre_usua"].ToString();


            informacion.Rows.Add(fila);
        }
        return datos;
    }




    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }
}