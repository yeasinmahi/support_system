<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderChange.aspx.cs" Inherits="UI.Reports.OrderChange" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />

    <link href="../Content/Css/AutoComplete.css" rel="stylesheet" />
    <script src="../Scripts/WebForms/MSAjax/jquery-ui-1.8.20.js"></script>
    <script src="../Scripts/WebForms/MSAjax/jquery-ui-1.8.20.min.js"></script>
    <script src="../Scripts/WebForms/MSAjax/jquery-ui-1.8.22.custom.min.js"></script>
      <script>
         $(document).ready(function () {
             SearchText();
         });
         function Changed() {
             document.getElementById('hdfSearchBoxTextChange').value = 'true';
         }
         function SearchText() {
             $("#txtSearchCustomer").autocomplete({
                 source: function (request, response) {
                     $.ajax({
                         type: "POST",
                         contentType: "application/json;",
                         url: "OrderChange.aspx/GetAutoCompleteData",
                         data: '{"strSearchKey":"' + document.getElementById('txtSearchCustomer').value + '"}',
                         dataType: "json",
                         success: function (data) {
                             response(data.d);
                         },
                         error: function (result) {

                         }
                     });
                 }
             });
         }
    </script>

</head>
<body>
    <form id="frmOrderChange" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>
        <asp:HiddenField ID="HdfSearchbox" runat="server" />
        <asp:HiddenField ID="hdnProduct" runat="server" /><asp:HiddenField ID="hdnProductID" runat="server" />
        <asp:HiddenField ID="hdnPrice" runat="server" />
        <div class="leaveApplication_container">
        <table class="tbldecoration" style="width:auto; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> ORDER CHANGE FORM (AFBL) :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Line : "></asp:Label></td>
        <td class="tdheight"> <asp:DropDownList ID="ddlLine" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlLine_SelectedIndexChanged" >
            <asp:ListItem Value="1">A</asp:ListItem>
            <asp:ListItem Value="2">B</asp:ListItem>
            <asp:ListItem Value="3">D</asp:ListItem>
            <asp:ListItem Value="7">Corp</asp:ListItem>
            <asp:ListItem Value="4">Export</asp:ListItem>
            </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="Item Name : "></asp:Label></td>
        <td class="tdheight"><asp:DropDownList ID="ddlItem" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" ></asp:DropDownList></td>
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Depot Name : "></asp:Label></td>
        <td class="tdheight">
        <asp:DropDownList ID="ddlDepot" runat="server" CssClass="ddList" ></asp:DropDownList>
        </td>        

        <td class="tdheight" style="text-align:right;"><asp:Label ID="lblitm" CssClass="lbl" Font-Size="small" runat="server" Text="Distributor List : "></asp:Label></td>
        <td class="tdheight"><asp:TextBox ID="txtSearchCustomer"  Class="autocomplete_completionListElement" runat="server"  width="400" BorderColor="Green" CssClass="txtBox" onchange="javascript: Changed();"  ></asp:TextBox></td>        
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" runat="server" Text="Qty(+/-) : "></asp:Label></td>
        <td class="tdheight">
        <asp:TextBox ID="txtqty" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>        
        </tr>
        <tr>
        <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnSubmit" runat="server" class="myButton" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>