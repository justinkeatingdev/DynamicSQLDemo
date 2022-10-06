using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace DynamicSQLDemo


{
    public partial class SearchPageWithoutDynamicSQL : System.Web.UI.Page

    {
        //search button class
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string connectionStr = ConfigurationManager.ConnectionStrings["connectionStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionStr))
                //connects the button to web.config database page 

            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "spPart";           //procedure from sql goes here when button clicked where stored procedure is 
                cmd.CommandType = CommandType.StoredProcedure;


                if (inputSerialNumber.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@SerialNumber", inputSerialNumber.Value);               //stores value from sql database variable to query search serial
                    cmd.Parameters.Add(param);
                }


                if (inputPartNumber.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@partID", inputPartNumber.Value);                   //stores value from sql database variable to query search part
                    cmd.Parameters.Add(param);
                }


                if (inputJobNumber.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@JobID", inputJobNumber.Value);                 //stores value from sql database variable to query search  job
                    cmd.Parameters.Add(param);
                }


                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                gvSearchResults.DataSource = rdr;             //binds queried data to the gridview
                gvSearchResults.DataBind();

            }
        }



        //export class button
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=MachineData.xls");         //takes gridview and downloads a excel file of it when button is clicked on webpage
            Response.ContentType = "application/excel";

            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter); //makes gridview a string to store onto excel sheet

            gvSearchResults.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)      //we need this because render write doesnt get along with gridview 
        {
        }
    }
}