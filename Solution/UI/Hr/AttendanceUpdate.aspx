<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceUpdate.aspx.cs" Inherits="UI.HR.AttendanceUpdate" %>

<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
    <style type="text/css">
        .auto-style2 {
            width: 41px;
        }
    </style>
</head>
<body>
    <form id="frmEmpUpdate" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <asp:HiddenField ID="hdnconfirm" runat="server" />

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Employee Attendance Update</td></tr>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblDate" CssClass="lbl" runat="server" Text="Month : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtDate" runat="server" CssClass="txtBox"></asp:TextBox>
            <script type="text/javascript"> new datepickr('txtDate', { 'dateFormat': 'Y-m-d' });</script></td>
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnShow" runat="server" CssClass="myButton" Text="Show" OnClick="btnShow_Click" /></td>
        </tr>
    
        <tr>
            <td class="tdheight" colspan="4" style="text-align:center;">
                <asp:GridView ID="dgvAttendance" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />

                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>              

                        <asp:TemplateField HeaderText="Auto ID" SortExpression="intAutoId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblAutoID" Width="50px" runat="server" Text='<%# (""+Eval("intAutoId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Date" SortExpression="dteDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblDate" Width="80px" runat="server" Text='<%# Eval("dteDate", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Status" SortExpression="strStatus" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblStatus" Width="80px" runat="server" Text='<%# Bind("strStatus") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Select Type" SortExpression="strStatus" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:DropDownList ID="ddlStatus" Width="150px" runat="server" CssClass="ddList">
                        <asp:ListItem Value="1">Present</asp:ListItem><asp:ListItem Selected="False" Value="2">Absent</asp:ListItem><asp:ListItem Selected="False" Value="3">Leave</asp:ListItem><asp:ListItem Selected="False" Value="4">Movement</asp:ListItem><asp:ListItem Selected="False" Value="5">Holiday</asp:ListItem><asp:ListItem Selected="False" Value="6">Off Day</asp:ListItem></asp:DropDownList></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="150px"/></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Update" >
                        <ItemTemplate><asp:Button ID="btnUpdate" runat="server" CssClass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intAutoId")+","+ Container.DataItemIndex %>'    Text="Update" OnClick="btnUpdate_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete" >
                        <ItemTemplate><asp:Button ID="btnDelete" runat="server" CssClass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intAutoId")+","+ Container.DataItemIndex %>'    Text="Delete" OnClick="btnDelete_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>
                        

                        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
            </td>
        </tr>
    </table>

    </div>
<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>