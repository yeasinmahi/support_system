<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHPermission.aspx.cs" Inherits="UI.Scm.WHPermission" %>
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
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> WARE HOUSE PERMISSION :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Unit Name : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlUnit" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged"></asp:DropDownList></td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="WH Name : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlWH" runat="server" CssClass="ddList"></asp:DropDownList></td>
        </tr>
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show" Width="160px" OnClick="btnShow_Click" /></td>           
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>

        <tr>
            <td colspan="4" >
                <asp:CheckBox ID="cbRequisition" runat="server"/><asp:Label ID="Label2" runat="server" Text=" Requisition" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="" Font-Size="12px" Width="12px" ></asp:Label>
                <asp:CheckBox ID="cbRequisitionApproval" runat="server" /><asp:Label ID="Label4" runat="server" Text=" Requisition Approval" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label8" runat="server" Text="" Font-Size="12px" Width="12px" ></asp:Label> 
                <asp:CheckBox ID="cbIndent" runat="server" /><asp:Label ID="Label5" runat="server" Text=" Indent" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="" Font-Size="12px" Width="36px" ></asp:Label>
                <asp:CheckBox ID="cbIndentApproval" runat="server" /><asp:Label ID="Label6" runat="server" Text=" Indent Approval" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label10" runat="server" Text="" Font-Size="12px" Width="30px" ></asp:Label> 
                <asp:CheckBox ID="cbSuperUser" runat="server" /><asp:Label ID="Label20" runat="server" Text=" Super User" Font-Size="12px" ></asp:Label>                
            </td>
            
        </tr>
        <tr>
            <td class="tdheight"  colspan="4" >
                <asp:CheckBox ID="cbPO" runat="server" /><asp:Label ID="Label11" runat="server" Text=" PO" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label12" runat="server" Text="" Font-Size="12px" Width="54px" ></asp:Label>
                <asp:CheckBox ID="cbPOApproval" runat="server" /><asp:Label ID="Label13" runat="server" Text=" PO Approval" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label14" runat="server" Text="" Font-Size="12px" Width="54px" ></asp:Label> 
                <asp:CheckBox ID="cbStroreUser" runat="server" /><asp:Label ID="Label15" runat="server" Text=" Store User" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label16" runat="server" Text="" Font-Size="12px" Width="12px" ></asp:Label>
                <asp:CheckBox ID="cbProductionPlanner" runat="server" /><asp:Label ID="Label17" runat="server" Text=" Production Planner" Font-Size="12px" ></asp:Label>
                <asp:Label ID="Label18" runat="server" Text="" Font-Size="12px" Width="12px" ></asp:Label>
                <asp:CheckBox ID="cbDistribution" runat="server" /><asp:Label ID="Label19" runat="server" Text=" Distribution" Font-Size="12px" ></asp:Label>
            </td>
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnPermission" runat="server" class="myButton" Text="WH Permission" Width="160px" OnClientClick = "ConfirmAll()" OnClick="btnPermission_Click" /></td>           
        </tr>

    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>