<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPageWithoutDynamicSQL.aspx.cs" Inherits="DynamicSQLDemo.SearchPageWithoutDynamicSQL" %>

<!DOCTYPE html>

<html>



<head runat="server">
    <title>Employee Search</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"         <%--custom bootstrap design for .css stylesss--%>
        type="text/css" />


    <style>
        body {
            background-color: white;
            }
    </style>


</head>



<body style="padding-top: 10px" >



    <div class="col-xs-8 col-xs-offset-2">
        <form id="form1" runat="server" class="form-horizontal">


            <center>
            <img src="https://logos-download.com/wp-content/uploads/2018/02/DANA_logo_brand-700x700.png" alt="dana_logo" style="width:400px;height:300px;">
            </center>   <%--dana logo--%>


            <div class="panel panel-primary">
                <div class="panel-heading">      <%--Title--%>
                    <h3>Part Search</h3>
                </div>



                <div class="panel-body">


                    <div class="form-group">
                        <label for="inputSerialNumber" class="control-label col-xs-2">
                            Serial Number:
                        </label>                                                         <%--serial number query with id--%>
                        <div class="col-xs-10">
                            <input type="text" runat="server" class="form-control"                 
                                id="inputSerialNumber" placeholder="Serial Number" />
                        </div>
                    </div>




                    <div class="form-group">
                        <label for="inputPartNumber" class="control-label col-xs-2">
                            Part Number:
                        </label>                                                             <%--part number query with id--%>
                        <div class="col-xs-10">
                            <input type="text" runat="server" class="form-control"              
                                id="inputPartNumber" placeholder="Part Number" />
                        </div>
                    </div>





                    <div class="form-group">
                        <label for="inputJobNumber" class="control-label col-xs-2">
                            Job Number:
                        </label>
                        <div class="col-xs-10">                                            <%--Job number query with id--%>
                            <input type="text" runat="server" class="form-control"
                                id="inputJobNumber" placeholder="Job Number" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-xs-10 col-xs-offset-2">
                            <asp:Button ID="btnSearch" runat="server" Text="Search"
                                CssClass="btn btn-primary" OnClick="btnSearch_Click"  />           <%--button that applies search, class is in .cs for onclick--%>
                        </div>
                    </div>
                </div>
            </div>




            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Search Results</h3>
                </div>                                     <%--gridview that displays queryed data--%>
                <div class="panel-body">
                    <div class="col-xs-10">                                
                        <asp:GridView CssClass="table table-bordered"      
                            ID="gvSearchResults" runat="server" >
                        </asp:GridView> 
                    </div>
                </div>
            </div>



            <%--Button ToolTip print to excel is linked to .cs file--%>
        <asp:Button ID="btnExportToExcel" runat="server" 
                Text="Export to Excel"
                CssClass="btn btn-primary"                   
                OnClick="btnExportToExcel_Click" />                 
            

        </form>
    </div>
</body>
</html>
