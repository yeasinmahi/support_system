<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemApproval.aspx.cs" Inherits="UI.Scm.ItemApproval" %>
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
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> ITEM APPROVAL FORM (GLOBAL) :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>

        <tr class="tblrowodd"><td colspan="4">
        <asp:GridView ID="dgvItem" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="8"
        CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL." ItemStyle-HorizontalAlign="Center"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>        
        <asp:BoundField DataField="intAutoID" HeaderText="intAutoID" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="intAutoID">
        <ItemStyle HorizontalAlign="Left" Width="50px"/></asp:BoundField>
        <asp:BoundField DataField="strWareHoseName" HeaderText="Ware House Name" ItemStyle-HorizontalAlign="Center" SortExpression="strWareHoseName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strLocationName" HeaderText="Location" ItemStyle-HorizontalAlign="Center" SortExpression="strLocationName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strItemName" HeaderText="Item Name" ItemStyle-HorizontalAlign="Center" SortExpression="strItemName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="300px"/></asp:BoundField>
        <asp:BoundField DataField="strDescription" HeaderText="Description" ItemStyle-HorizontalAlign="Center" SortExpression="strDescription">
        <ItemStyle HorizontalAlign="Left" Width="300px"/></asp:BoundField>
        <asp:BoundField DataField="strPart" HeaderText="Part No." ItemStyle-HorizontalAlign="Center" SortExpression="strPart">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strUOM" HeaderText="UOM" ItemStyle-HorizontalAlign="Center" SortExpression="strUOM">
        <ItemStyle HorizontalAlign="Left" Width="80px"/><HeaderStyle HorizontalAlign="Center" /></asp:BoundField>
        <asp:BoundField DataField="strItemType" HeaderText="Item Type" ItemStyle-HorizontalAlign="Center" SortExpression="strItemType" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="100px"/></asp:BoundField>
        <asp:BoundField DataField="strCluster" HeaderText="Cluster" ItemStyle-HorizontalAlign="Center" SortExpression="strCluster">
        <ItemStyle HorizontalAlign="Left" Width="130px"/></asp:BoundField>
        <asp:BoundField DataField="strCommodity" HeaderText="Commodity" ItemStyle-HorizontalAlign="Center" SortExpression="strCommodity">
        <ItemStyle HorizontalAlign="Left" Width="170px"/></asp:BoundField>
        <asp:BoundField DataField="strCategory" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="strCategory">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strBrand" HeaderText="Brand" ItemStyle-HorizontalAlign="Center" SortExpression="strBrand">
        <ItemStyle HorizontalAlign="Left" Width="130px"/></asp:BoundField>
         
        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" SortExpression="">
        <ItemTemplate><asp:Button ID="btnApprove" class="myButton" OnClientClick = "ConfirmAll()" OnCommand="btnApprove_OnCommand" runat="server" CommandName="Y" Font-Size="9px" 
        CommandArgument='<%# Eval("intAutoID") %>' Text="Approve"/></ItemTemplate><ItemStyle HorizontalAlign="Left"/></asp:TemplateField>
        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" SortExpression="">
        <ItemTemplate><asp:Button ID="btnReject" class="myButton" OnClientClick = "ConfirmAll()" OnCommand="btnReject_OnCommand" runat="server" CommandName="R" Font-Size="9px" 
        CommandArgument='<%# Eval("intAutoID") %>' Text="Reject"/></ItemTemplate><ItemStyle HorizontalAlign="Left"/></asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" /><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" /><SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" /> <SortedAscendingHeaderStyle BackColor="#808080" /><SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </td></tr>

    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>