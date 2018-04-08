<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnderMaintanance.aspx.cs" Inherits="UI.UnderMaintanance" %>

<!DOCTYPE html>

<html>
<head runat="server"><title></title>
    <meta name="developer" content="Md. Golam Kibria (Konock), konock.22@gmail.com" />
    <meta name="designer" content="Md. Golam Kibria (Konock), konock_08@yahoo.com" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, heigth=device-heigth, initial-scale=1.0, user-scalable=yes" />
    <asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
    <webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
</head>
<body>
    <form id="frmindex" runat="server"><asp:ScriptManager runat="server" ID="scriptManager" EnablePageMethods="true"></asp:ScriptManager>
    <div id="topbox"><table style="width:100%;">
    <tr><td style=" width:5%; text-align:left;"><img src="Content/Images/logo.png"/></td>
    <td style="text-align:center; font-size:25px;"> <strong>AKIJ GROUP</strong> <br/>
    <a class="blink_me">ACL Point ERP Solution</a></td></tr></table>
    </div>

    <table class="tbldecoration" style="width:100%;">
    <tr class="tblroweven"> <td style="text-align:center; font-size:25px; background-color:white;"><br /><br /><b><u>_UNDER MAINTANANCE_</u></b>  <br /><br /> 
    <asp:Panel ID="um" runat="server" style="color:red; font:bold 14px verdana;"><%# str %></asp:Panel>
    <asp:Label ID="lblUm" runat="server" CssClass="lbl" style="color:green; font:bold 13px verdana;" Text=""></asp:Label>
    </td></tr> 
</table>


<div id="footerbox" style="text-align:center;"><br/><br/><br/><br/><br/>
    Developed By : Akij Group. Copyright @ Acl.akij.net 2014 - 2016</div>
    </form>
</body>
</html>
