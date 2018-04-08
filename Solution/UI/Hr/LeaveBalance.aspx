<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveBalance.aspx.cs" Inherits="UI.HR.LeaveBalance" %>

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
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Leave Balance Update </td>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnCheck" runat="server" CssClass="myButton" Text="Check" OnClick="btnCheck_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>

        <tr>
            <td class="tdheight" colspan="4" style="text-align:center">
                <asp:GridView ID="dgvLeaveBalance" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="ID" SortExpression="intAutoId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblID" Width="50px" runat="server" Text='<%# (""+Eval("intAutoId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Enroll" SortExpression="intEmployeeID" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblEnroll" Width="80px" runat="server" Text='<%# Bind("intEmployeeID") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Leave Type" SortExpression="strRemarks" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblRemarks" Width="80px" runat="server" Text='<%# Bind("strRemarks") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Leave Taken Days" SortExpression="intLeaveTakenDays" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtLeaveTaken" Width="80px" runat="server" Text='<%# Bind("intLeaveTakenDays") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Remaining Leave Days" SortExpression="intRemainingDays" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtRemaining" Width="80px" runat="server" Text='<%# Bind("intRemainingDays") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Update" >
                        <ItemTemplate><asp:Button ID="btnUpdate" runat="server" Cssclass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intAutoId")+","+ Container.DataItemIndex %>'    Text="Update" OnClick="btnUpdate_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>
                        
                        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
            </td>
        </tr>
        

      
        

    </Table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>