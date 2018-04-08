<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemForAFBL.aspx.cs" Inherits="UI.Scm.ItemForAFBL" %>
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
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> ITEM ADD FORM (AFBL) :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label10" CssClass="lbl" runat="server" Text="WH Name : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlWH" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlWH_SelectedIndexChanged" ></asp:DropDownList></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label12" CssClass="lbl" runat="server" Text="Type : "></asp:Label></td>
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
            <td class="tdheight"><asp:DropDownList ID="ddlCommodity" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlCommodity_SelectedIndexChanged" ></asp:DropDownList></td>        
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
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label8" CssClass="lbl" runat="server" Text="Minor Category : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlMinorCat" runat="server" CssClass="ddList" ></asp:DropDownList></td>

           <td class="tdheight" style="text-align:right;"><asp:Label ID="Label9" CssClass="lbl" runat="server" Text="Plant : "></asp:Label></td>
           <td class="tdheight"><asp:DropDownList ID="ddlPlant" runat="server" CssClass="ddList" ></asp:DropDownList></td>        
        </tr>
        <tr>
            <%--<td class="tdheight" style="text-align:right;"><asp:Label ID="Label11" CssClass="lbl" runat="server" Text="Procure Type : "></asp:Label></td>            
            <td class="tdheight"><asp:DropDownList ID="ddlProcureType" runat="server" CssClass="ddList" AutoPostBack="true">
            <asp:ListItem Selected="True" Value="1">Local</asp:ListItem><asp:ListItem Value="2">Import</asp:ListItem>
            <asp:ListItem Value="3">Common</asp:ListItem></asp:DropDownList></td>--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label11" CssClass="lbl" runat="server" Text="Re-Order Level : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtReOrderLevel" runat="server" CssClass="txtBox" ></asp:TextBox></td> 
            
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label13" CssClass="lbl" runat="server" Text="Store Location : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddList" ></asp:DropDownList></td>        
        </tr>
        
        
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label17" CssClass="lbl" runat="server" Text="Minimum Stock Level : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtMinimumStock" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label18" CssClass="lbl" runat="server" Text="Miximum Stock Level : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtMaximumStock" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label19" CssClass="lbl" runat="server" Text="Safety Stock Level : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtSafetyStock" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label20" CssClass="lbl" runat="server" Text="ABC Classification : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlABCClassification" runat="server" CssClass="ddList">
            <asp:ListItem Selected="True" Value="1">A</asp:ListItem><asp:ListItem Value="2">B</asp:ListItem>
            <asp:ListItem Value="3">C</asp:ListItem></asp:DropDownList></td>       
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label22" CssClass="lbl" runat="server" Text="FSN Classification : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlFSNClassification" runat="server" CssClass="ddList">
            <asp:ListItem Selected="True" Value="1">Fast</asp:ListItem><asp:ListItem Value="2">Slow</asp:ListItem>
            <asp:ListItem Value="3">Non-Moving</asp:ListItem></asp:DropDownList></td>
            
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label21" CssClass="lbl" runat="server" Text="VDE Classification : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlVDEClassification" runat="server" CssClass="ddList">
            <asp:ListItem Selected="True" Value="1">Vital</asp:ListItem><asp:ListItem Value="2">Essential</asp:ListItem>
            <asp:ListItem Value="3">Desireable</asp:ListItem></asp:DropDownList></td>      
        </tr>
        <tr>
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnSubmit" runat="server" class="myButton" Text="Submit" OnClientClick = "ConfirmAll()" OnClick="btnSubmit_Click"/></td>
        </tr>
    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>