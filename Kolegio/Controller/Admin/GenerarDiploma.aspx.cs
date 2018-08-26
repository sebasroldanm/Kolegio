using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Admin_GenerarDiploma : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

       
        Session["documentoe"] = GridView1.SelectedRow.Cells[3].Text;
       

        Page.RegisterStartupScript("script", "<script>window.open('/View/Admin/DescargarDiploma.aspx' ,'Descargar','height=500', 'width=1000')</script>");

      
    }

    protected void ODS_curso_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}