using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_DescargarAcudientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            try
            {
                InfReporte reporte = ObtenerInforme();
                CRS_acudientes.ReportDocument.SetDataSource(reporte);
                CrystalReportViewer1.ReportSource = CRS_acudientes;
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

        DataRow fila;
        DataTable informacion = new DataTable();
        InfReporte datos = new InfReporte();

        informacion = datos.Tables["Acudiente"]; // nombre de la tabla que cree en crystal en el InfReporte.xsd


        DaoUser administrador = new DaoUser();

        DataTable Intermedio = administrador.obteneracudientes();


        for (int i = 0; i < Intermedio.Rows.Count; i++) // for para llenar la lista con cada usurario
                                                        //// si es solo un dato como con el certificado de estudio, no se hace el for
        {

            fila = informacion.NewRow();
            ///El primero [""]  es como se llama el campo de la tabla de crystal y el segundo [""] el campo de la tabla en postgres
            fila["Apellido"] = Intermedio.Rows[i]["apellido_usua"].ToString();
            fila["Nombre"] = Intermedio.Rows[i]["nombre_usua"].ToString();
            fila["Documento"] = int.Parse(Intermedio.Rows[i]["num_documento"].ToString());
            fila["Telefono"] = Intermedio.Rows[i]["telefono"].ToString();
            fila["Correo"] = Intermedio.Rows[i]["correo"].ToString();
           

            informacion.Rows.Add(fila);
        }
        return datos;
    }



    protected void CRV_administradores_Init(object sender, EventArgs e)
    {

    }







    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }
}
