<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="UI.Home" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html>
<head runat="server"><title>.: Welcome to AG :.</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, heigth=device-heigth, initial-scale=1.0, user-scalable=yes" />
    <asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
    <webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

</head><%--oncontextmenu="return false;"--%>
<body >    
    <form id="frmhome" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager" EnablePageMethods="true"></asp:ScriptManager>
    <div id="topbox"><table style="width:100%;">
    <tr><td style=" width:5%; text-align:left;"><img src="Content/Images/logo.png"/></td>
    <td style="text-align:center; font-size:25px;"> <strong style="color:darkgoldenrod;"><u>AKIJ GROUP</u></strong> <br/>
    <a class="blink_me"><b>ERP Support Solution</b></a></td></tr>
    <tr><td colspan="2" style="background-color:#faf2f2;"><br />
    <a class="signout" title="Sign Out" href="Logout.aspx" style="text-align:right;" >Sign-Out</a>
    <a style="width:400px; text-align:left; font-weight:bold; border:0px solid #000; margin-left:5px;"><asp:Label ID="txtloginuser" Enabled="false" runat="server"></asp:Label></a>
    <br /></td></tr></table>
    </div>

    <div class="contentholder">
    <div id="divmenuholder"><telerik:RadPanelBar runat="server" ID="RadPanel" Width="100%" skin="Web20"></telerik:RadPanelBar></div>
    <asp:UpdatePanel ID="updtpnl" runat="server"><ContentTemplate>
    <div id="divcontentholder"><iframe runat="server" oncontextmenu="return false;" id="frame" name="frame" style="width:100%; height:1500px; border:0px solid red;"></iframe></div>
    </ContentTemplate></asp:UpdatePanel>
    </div>
    <div id="footerbox">Developed By : Akij Group. Copyright @ support.akij.net 2017 - 2018</div>
    </form>



</body>
</html>

