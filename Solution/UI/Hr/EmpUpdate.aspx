<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpUpdate.aspx.cs" Inherits="UI.HR.EmpUpdate" %>

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

    <asp:HiddenField ID="hdnempid" runat="server" />

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Search Employee </td></tr>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblSEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtSEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblSCode" CssClass="lbl" runat="server" Text="Code : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtSCode" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblSEmail" CssClass="lbl" runat="server" Text="Email : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtSEmail" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td class="tdheight" colspan="2" style="text-align:right;"><asp:Button ID="btnShow" runat="server" CssClass="myButton" Text="Show" OnClick="btnShow_Click" /></td>
        </tr>
    </Table></div>
    <div>
    <Table>
        <tr>
            <td class="tdheight">
                <asp:GridView ID="dgvEmpInfo" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>              

                        <asp:TemplateField HeaderText="Enroll" SortExpression="intEmployeeID" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblEnroll" Width="50px" runat="server" Text='<%# (""+Eval("intEmployeeID")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Code" SortExpression="strEmployeeCode" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtCode" Width="80px" runat="server" Text='<%# Bind("strEmployeeCode") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Card No" SortExpression="strSortName" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtCardNo" Width="80px" runat="server" Text='<%# Bind("strSortName") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Name" SortExpression="strEmployeeName" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtName" Width="100px" runat="server" Text='<%# Bind("strEmployeeName") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Email" SortExpression="strOfficeEmail" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtEmail" Width="150px" runat="server" Text='<%# Bind("strOfficeEmail") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="150px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Supervisor" SortExpression="intSuperviserId" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtSupervisor" Width="70px" runat="server" Text='<%# Bind("intSuperviserId") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Appoinment Date" SortExpression="dteAppointmentDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtAppoint" Width="80px" runat="server" Text='<%# Eval("dteAppointmentDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Joining Date" SortExpression="dteJoiningDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtJoinDate" Width="80px" runat="server" Text='<%# Eval("dteJoiningDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Birth" SortExpression="dteBirth" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtBirth" Width="80px" runat="server" Text='<%# Eval("dteBirth", "{0:yyyy-MM-dd}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact No" SortExpression="strContactNo1" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtContact" Width="80px" runat="server" Text='<%# Bind("strContactNo1") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Active" SortExpression="ysnActive" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:CheckBox ID="chkActive" runat="server" Checked='<%# Bind("ysnActive") %>'/></ItemTemplate><ItemStyle HorizontalAlign="Center"/>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salary Hold" SortExpression="ysnSalaryHold" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:CheckBox ID="chkSalaryHold" runat="server" Checked='<%# Bind("ysnSalaryHold") %>'/></ItemTemplate><ItemStyle HorizontalAlign="Center"/>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Update" >
                        <ItemTemplate><asp:Button ID="btnUpdate" runat="server" Cssclass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intEmployeeID")+","+ Container.DataItemIndex %>'    Text="Update" OnClick="btnUpdate_Click"/>
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