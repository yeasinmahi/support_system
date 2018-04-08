<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndentCorrection.aspx.cs" Inherits="UI.Scm.IndentCorrection" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
</head>
<body>
    <form id="frmattendance" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>
    <asp:HiddenField ID="hdnconfirm" runat="server" /><asp:HiddenField ID="hdnWHID" runat="server" />
    <asp:HiddenField ID="hdnEnroll" runat="server" /><asp:HiddenField ID="hdnUnit" runat="server" />

    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> INDENT CORRECTION :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Indent No. : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtIndentNo" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td style="text-align:right; padding: 10px 0px 0px 10px"><asp:Button ID="btnIndentActive" runat="server" class="myButton" Text="Active" OnClientClick = "ConfirmAll()" OnClick="btnIndentActive_Click" /></td>
            <td style="text-align:right; padding: 10px 0px 0px 100px"><asp:Button ID="btnIndentInactive" runat="server" class="myButton" Text="Inactive"  Width="130px" OnClientClick = "ConfirmAll()" OnClick="btnIndentInactive_Click"/></td>           
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Item ID : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtItemID" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" runat="server" Text="Quantity : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtQty" runat="server" CssClass="txtBox" ></asp:TextBox></td>                        
        </tr>
        <tr>
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 10px"><asp:Button ID="btnQtyChange" runat="server" class="myButton" Text="Change Qty" Width="130px" OnClientClick = "ConfirmAll()" OnClick="btnQtyChange_Click"/></td>         
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label11" CssClass="lbl" runat="server" Text="Procure Type : "></asp:Label></td>            
            <td class="tdheight"><asp:DropDownList ID="ddlProcureType" runat="server" CssClass="ddList" AutoPostBack="true">
            <asp:ListItem Selected="True" Value="1">Local</asp:ListItem><asp:ListItem Value="2">Import</asp:ListItem>
            <asp:ListItem Value="3">Common</asp:ListItem></asp:DropDownList></td>

            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 10px"><asp:Button ID="btnProcureType" runat="server" class="myButton" Text="Type Change" Width="130px" OnClientClick = "ConfirmAll()" OnClick="btnProcureType_Click"/></td>         
        </tr>
        
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        
     </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>