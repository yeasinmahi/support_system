<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HrAkijNetPermission.aspx.cs" Inherits="UI.HR.HrAkijNetPermission" %>

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
    <form id="frmEmpUpdate" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <asp:HiddenField ID="hdnconfirm" runat="server" /><asp:HiddenField ID="hdnempid" runat="server"/>

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> hr.akij.net Permission </td>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEmail" CssClass="lbl" runat="server" Text="Email : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEmail" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>

        <tr>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnCheck" runat="server" CssClass="myButton" Text="Check" OnClick="btnCheck_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>

        <tr class="tblheader"><td colspan="4" style="text-align:center"> Employee Information </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblName" runat="server" CssClass="lbl" Text="Name :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Enabled="false"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblCardNo" runat="server" CssClass="lbl" Text="Card No :" Enabled="false"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtCardNo" runat="server" CssClass="txtBox" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblPhoneNo" runat="server" CssClass="lbl" Text="Phone Number :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtPhoneNo" runat="server" CssClass="txtBox" Enabled="false"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblAppointDate" runat="server" CssClass="lbl" Text="Appointment Date :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtAppointDate" runat="server" CssClass="txtBox" Enabled="false"></asp:TextBox></td>
        </tr>

        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblJobType" runat="server" CssClass="lbl" Text="Job Type :" Visible="false"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtJobType" runat="server" CssClass="txtBox" Enabled="false" Visible="false"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblUnitID" runat="server" CssClass="lbl" Text="Unit ID :" Visible="false"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtUnitID" runat="server" CssClass="txtBox" Enabled="false" Visible="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblDepartment" runat="server" CssClass="lbl" Text="Department ID :" Visible="false"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtDepartment" runat="server" CssClass="txtBox" Enabled="false" Visible="false"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblDesignation" runat="server" CssClass="lbl" Text="Designation ID :" Visible="false"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtDesignation" runat="server" CssClass="txtBox" Enabled="false" Visible="false"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnSubmit" runat="server" CssClass="myButton" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
        

      
        

    </Table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>