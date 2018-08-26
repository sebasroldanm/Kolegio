using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_DescargarProfesores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        Response.Cache.SetNoStore();
        if (Session["userId"] != null)
        {
            try
            {
                InfReporte reporte = ObtenerInforme();
                CRS_listaProfesor.ReportDocument.SetDataSource(reporte);
                CrystalReportViewer1.ReportSource = CRS_listaProfesor;
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

        informacion = datos.Tables["Profesor"]; // nombre de la tabla que cree en crystal en el InfReporte.xsd


        DaoUser profesor = new DaoUser();

        DataTable Intermedio = profesor.obtenerprofesores();


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
            fila["Foto"] = streamFile(Intermedio.Rows[i]["foto_usua"].ToString());

            informacion.Rows.Add(fila);
        }
        return datos;
    }



    protected void CRV_administradores_Init(object sender, EventArgs e)
    {

    }


    private byte[] streamFile(string filename)
    {
        FileStream fs;

        if (!filename.Equals(""))
        {
            fs = new FileStream(Server.MapPath(filename), FileMode.Open, FileAccess.Read);
        }

        else
        {
            fs = new FileStream(Server.MapPath("~/FotosUser/Useruser.png"), FileMode.Open, FileAccess.Read);

        }


        // Create a byte array of file stream length
        byte[] ImageData = new byte[fs.Length];

        //Read block of bytes from stream into the byte array
        fs.Read(ImageData, 0, System.Convert.ToInt32(fs.Length));

        //Close the File Stream
        fs.Close();
        return ImageData; //return the byte data
    }







    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }

    protected void CrystalReportViewer1_Init1(object sender, EventArgs e)
    {

    }
}