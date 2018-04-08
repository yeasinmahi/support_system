<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="UI.Personal" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
</head>
<body>
    <form id="frminformation" runat="server">
     <asp:Panel ID="pnlpersonalinformation" runat="server"><%# strinformation %></asp:Panel><br /> 
    </form>
</body>
</html>
