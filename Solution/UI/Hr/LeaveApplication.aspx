<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApplication.aspx.cs" Inherits="UI.HR.LeaveApplication" %>

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
    <form id="frmLeaveApplication" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <asp:HiddenField ID="hdnconfirm" runat="server" /><asp:HiddenField ID="hdnempid" runat="server"/>

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="5" style="text-align:center"> Input At least Any One of Below Field </td>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblCode" CssClass="lbl" runat="server" Text="Code : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtCode" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        
            <td class="tdheight" colspan="5" style="text-align:right;"><asp:Button ID="btnShow" runat="server" CssClass="myButton" Text="Show" OnClick="btnShow_Click" /></td>
        </tr>

        <tr class="tblheader"><td colspan="5" style="text-align:center"> Leave Information </td></tr>
        <tr>
            <td class="tdheight" colspan="5" style="text-align:center;">
                <asp:GridView ID="dgvLeave" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />

                        <Columns>

                        <asp:TemplateField HeaderText="SL No." Visible="false"><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="Auto ID" SortExpression="intApplicationId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblID" Width="50px" runat="server" Text='<%# (""+Eval("intApplicationId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Leave Type" SortExpression="strLeaveType" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblLeaveType" runat="server" Text='<%# Bind("strLeaveType") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Application Date" SortExpression="dateApplicationDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblApplicationDate" runat="server" Text='<%# Eval("dateApplicationDate", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Applied From Date" SortExpression="dateAppliedFromDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblAppliedFromDate" Width="80px" runat="server" Text='<%# Eval("dateAppliedFromDate", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Applied To Date" SortExpression="dateAppliedToDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblAppliedToDate" Width="80px" runat="server" Text='<%# Eval("dateAppliedToDate", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Leave Reason" SortExpression="strLeaveReason" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblLeaveReason" Width="80px" runat="server" Text='<%# Bind("strLeaveReason") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Status" SortExpression="srtApprovedStatus" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblLeaveType" Width="80px" runat="server" Text='<%# Bind("srtApprovedStatus") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Return" >
                        <ItemTemplate><asp:Button ID="btnUpdate" runat="server" CssClass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intApplicationId")+","+ Container.DataItemIndex %>' Text="Return" OnClick="btnUpdate_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete" >
                        <ItemTemplate><asp:Button ID="btnDelete" runat="server" CssClass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intApplicationId")+","+ Container.DataItemIndex %>'    Text="Delete" OnClick="btnDelete_Click"/>
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