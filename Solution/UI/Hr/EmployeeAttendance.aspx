<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeAttendance.aspx.cs" Inherits="UI.HR.EmployeeAttendance" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
    </head>
<body>
    
    <form id="frmAttendance" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Employee Attendance Report </td><asp:HiddenField ID="hdnempid" runat="server"/></tr>
        <tr><td colspan="4"><hr></td></tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblDate" CssClass="lbl" runat="server" Text="Month : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtDate" runat="server" CssClass="txtBox"></asp:TextBox>
            <script type="text/javascript"> new datepickr('txtDate', { 'dateFormat': 'Y-m-d' });</script></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>
        <tr>
            <td class="tdheight" colspan="2" style="text-align:right"><asp:Button ID="btnExport" runat="server" CssClass="myButton" Text="Excel Report" OnClick="btnExport_Click" /></td>
            <td class="tdheight" colspan="4" style="text-align:right"><asp:Button ID="btnShow" runat="server" CssClass="myButton" Text="Show" OnClick="btnShow_Click" /></td>
        </tr>
        <tr><td colspan="5"><hr></td></tr>
        <tr>
            <td class="tdheight" colspan="5" style="text-align:center">
                <asp:GridView ID="dgvAttendance" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="Enroll" SortExpression="Enroll" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblEnroll" Width="50px" runat="server" Text='<%# (""+Eval("Enroll")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" SortExpression="Date" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblDate" Width="80px" runat="server" Text='<%# Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Present" SortExpression="Present" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblPresent" Width="50px" runat="server" Text='<%# Bind("Present") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Absent" SortExpression="Absent" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblAbsent" Width="50px" runat="server" Text='<%# Bind("Absent") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Leave" SortExpression="Leave" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblLeave" Width="50px" runat="server" Text='<%# Bind("Leave") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Movement" SortExpression="Movement" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblMovement" Width="50px" runat="server" Text='<%# Bind("Movement") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Holiday" SortExpression="Holiday" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblHoliday" Width="45px" runat="server" Text='<%# Bind("Holiday") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="45px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Day Off" SortExpression="Dayoff" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblDayOff" Width="50px" runat="server" Text='<%# Bind("Dayoff") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Late" SortExpression="Late" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblLate" Width="40px" runat="server" Text='<%# Bind("Late") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="40px" /></asp:TemplateField>
                    
                        
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