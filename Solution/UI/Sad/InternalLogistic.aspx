<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InternalLogistic.aspx.cs" Inherits="UI.Sad.InternalLogistic" %>
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
    <asp:HiddenField ID="hdnMrrUnitID" runat="server" />

    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> LOGISTIC (INTERNAL TRANSPORT) :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Trip SL No. : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtTripSLNo" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td colspan="1" style="text-align:right; padding: 10px 0px 0px 50px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show Challan" OnClick="btnShow_Click" /></td>
            <td colspan="1" style="text-align:right; padding: 10px 0px 0px 50px"><asp:Button ID="btnDelete" runat="server" class="myButton" Text="Trip Delete" OnClientClick = "ConfirmAll()" OnClick="btnDelete_Click" /></td>
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblrowodd"><td colspan="4">
        <asp:GridView ID="dgvChallanInfo" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="8"
        CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL." ItemStyle-HorizontalAlign="Center"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>        
        <asp:BoundField DataField="intAutoID" HeaderText="intAutoID" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="intAutoID">
        <ItemStyle HorizontalAlign="Left" Width="50px"/></asp:BoundField>
        <asp:BoundField DataField="strChallanNo" HeaderText="Challan No." ItemStyle-HorizontalAlign="Center" SortExpression="strItemName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Center" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="dteChallanDate" HeaderText="Challan Date" ItemStyle-HorizontalAlign="Center" SortExpression="strDescription">
        <ItemStyle HorizontalAlign="Center" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="intQuantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" SortExpression="strPart">
        <ItemStyle HorizontalAlign="Center" Width="170px"/></asp:BoundField>
        
        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" SortExpression="">
        <ItemTemplate><asp:Button ID="btnReject" class="myButton" OnClientClick = "ConfirmAll()" OnCommand="btnReject_OnCommand" runat="server" CommandName="R" Font-Size="9px" 
        CommandArgument='<%# Eval("intAutoID") %>' Text="Delete"/></ItemTemplate><ItemStyle HorizontalAlign="Left"/></asp:TemplateField>
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