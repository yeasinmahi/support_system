<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MilkPurchase.aspx.cs" Inherits="UI.Others.MilkPurchase" %>
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
    <asp:HiddenField ID="hdnMrrUnitID" runat="server" />

    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> MILK PURCHASE :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px; font-weight:bold; color:#041174;" colspan="4">MRR Delete :</td></tr>
        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="MRR No. : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtMRRNo" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 100px"><asp:Button ID="btnDelete" runat="server" class="myButton" Text="Delete MRR" OnClientClick = "ConfirmAll()" OnClick="btnDelete_Click" /></td>
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>

    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>