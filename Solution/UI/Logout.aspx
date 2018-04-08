<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="UI.Logout" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
</head>
<body>
    <form id="frmlogout" runat="server">
    <asp:Panel ID="Panellogout" runat="server" Visible="false">
    <script type="text/javascript"> window.top.location = "Exit.aspx";</script>
    </asp:Panel>
    </form>
</body>
</html>
