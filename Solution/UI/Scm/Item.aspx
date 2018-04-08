<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="UI.Scm.Item" %>
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
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> ITEM ADD FORM :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label8" CssClass="lbl" runat="server" Text="WH Name : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlWH" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlWH_SelectedIndexChanged" ></asp:DropDownList></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label9" CssClass="lbl" runat="server" Text="Type : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlItemType" runat="server" CssClass="ddList" ></asp:DropDownList></td>
        </tr>
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Item Base Name : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtItemBaseName" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

           <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="Cluster : "></asp:Label></td>
           <td class="tdheight"><asp:DropDownList ID="ddlCluster" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlCluster_SelectedIndexChanged" ></asp:DropDownList></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Item Description : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtItemDes" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" runat="server" Text="Commodity : "></asp:Label></td>
           <td class="tdheight"><asp:DropDownList ID="ddlCommodity" runat="server" CssClass="ddList" AutoPostBack ="true" OnSelectedIndexChanged="ddlCommodity_SelectedIndexChanged" ></asp:DropDownList></td>        
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label4" CssClass="lbl" runat="server" Text="Part/Model/Serial : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtPartNo" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label5" CssClass="lbl" runat="server" Text="Category : "></asp:Label></td>
           <td class="tdheight"><asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddList" ></asp:DropDownList></td>        
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label7" CssClass="lbl" runat="server" Text="UOM : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlUOM" runat="server" CssClass="ddList" ></asp:DropDownList></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label6" CssClass="lbl" runat="server" Text="Brand : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtBrand" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label10" CssClass="lbl" runat="server" Text="Store Location : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddList" ></asp:DropDownList></td>        

        </tr>
        <tr>
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnSubmit" runat="server" class="myButton" Text="Submit" OnClick="btnSubmit_Click" OnClientClick = "ConfirmAll()" /></td>
        </tr>
    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>