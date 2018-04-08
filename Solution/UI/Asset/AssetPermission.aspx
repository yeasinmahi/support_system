<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetPermission.aspx.cs" Inherits="UI.Asset.AssetPermission" %>

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
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> Asset Permission FORM :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
           <%-- <td class="tdheight" style="text-align:right;"><asp:Label ID="Label8" CssClass="lbl" runat="server" Text="Asset Type: "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlWH" runat="server" CssClass="ddList" >
            <asp:ListItem Text="General" Value="1"></asp:ListItem><asp:ListItem Text="Vehicle" Value="2"></asp:ListItem>
            <asp:ListItem Text="Land" Value="3"></asp:ListItem> <asp:ListItem Text="Building" Value="4"></asp:ListItem>
            </asp:DropDownList></td> --%>       

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label9" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:Textbox ID="txtEnroll" runat="server" CssClass="ddList" ></asp:Textbox></td>
             
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px">  <asp:CheckBox ID="chkGeneral" AutoPostBack="true" Text="General" runat="server" /><asp:CheckBox ID="chkVehicle" AutoPostBack="true" Text="Vehicle" runat="server" />
          <asp:CheckBox ID="chkLand" Text="Land" AutoPostBack="true" runat="server" /><asp:CheckBox ID="chkBuild" Text="Building" runat="server" /></td>

        </tr>
        <tr>
           <td colspan="4"  style="text-align:right; padding: 10px 0px 0px 0px">  <asp:Label ID="lblInfo"     runat="server" /></td>
        </tr>
     
        <tr>
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px">
                    <asp:Button ID="btnView" runat="server" class="myButton" Text="View" OnClick="btnView_Click"  /> 
           <asp:Button ID="btnSubmit" runat="server" class="myButton" Text="Submit" OnClick="btnSubmit_Click"  /></td>
        </tr>
    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>
