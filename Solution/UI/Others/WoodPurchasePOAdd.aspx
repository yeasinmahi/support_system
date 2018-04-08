<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WoodPurchasePOAdd.aspx.cs" Inherits="UI.Others.WoodPurchasePOAdd" %>
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
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> WOOD PURCHASE :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px; font-weight:bold; color:#041174;" colspan="4">PO ADD :</td></tr>
        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label8" CssClass="lbl" runat="server" Text="WH Name : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlWH" runat="server" CssClass="ddList"></asp:DropDownList></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="PO : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtPO" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnDeletePO" runat="server" class="myButton" Text="Inactive PO" OnClientClick = "ConfirmAll()" OnClick="btnDeletePO_Click" /></td>
            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnSubmit" runat="server" class="myButton" Text="ADD PO" OnClientClick = "ConfirmAll()" OnClick="btnSubmit_Click" /></td>
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px; font-weight:bold; color:#041174;" colspan="4">MRR CANCEL :</td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>        
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="MRR No : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtMRRNo" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnDelete" runat="server" class="myButton" Text="Delete MRR" OnClientClick = "ConfirmAll()" OnClick="btnDelete_Click" /></td>
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>

    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>