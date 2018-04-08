<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ACLResponsiblePersonSetup.aspx.cs" Inherits="UI.HR.ACLResponsiblePersonSetup" %>

<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="frmResponsiblePerson" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <asp:HiddenField ID="hdnconfirm" runat="server" />
    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Responsible Person Setup </td><asp:HiddenField ID="hdnempid" runat="server"/></tr>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" onkeypress="txtEnroll_TextChanged" AutoPostBack="true" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Button ID="btnCheck" runat="server" CssClass="myButton" Text="Check" OnClick="btnCheck_Click" /></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblResponsible" CssClass="lbl" runat="server" Text="Responsible Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtResponsible" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:left;"><asp:Button ID="btnInsert" runat="server" CssClass="myButton" Text="Insert" OnClick="btnInsert_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>


    </Table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>