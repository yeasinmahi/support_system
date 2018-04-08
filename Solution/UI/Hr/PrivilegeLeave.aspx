<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrivilegeLeave.aspx.cs" Inherits="UI.HR.PrivilegeLeave" %>

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

    <asp:HiddenField ID="hdnconfirm" runat="server" />

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Privilege Leave Entry </td><asp:HiddenField ID="hdnempid" runat="server"/></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblYear" CssClass="lbl" runat="server" Text="Year : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtYear" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>

        <tr>
            <td class="tdheight" colspan="4" style="text-align:center; color:Red;" ><asp:Label ID="lblInfo" CssClass="lbl" runat="server"></asp:Label></td>
            
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnCheck" runat="server" CssClass="myButton" Text="Check" OnClick="btnCheck_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>

        <tr class="tblheader"><td colspan="4" style="text-align:center"> Privilege Leave Schedule </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblSBasic" runat="server" CssClass="lbl" Text="Basic :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtSBasic" runat="server" CssClass="txtBox"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblLYear" runat="server" CssClass="lbl" Text="Leave Year :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtLYear" runat="server" CssClass="txtBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblLeaveTaken" runat="server" CssClass="lbl" Text="Leave Taken :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:CheckBox ID="chkLeaveTaken" runat="server" Enabled="false"></asp:CheckBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblExist" runat="server" CssClass="lbl" Text="Existence :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:CheckBox ID="chkExist" runat="server" Enabled="false"></asp:CheckBox></td>
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnScheduleEntry" runat="server" CssClass="myButton" Text="Schedule Entry" OnClick="btnScheduleEntry_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>

        <tr class="tblheader"><td colspan="4" style="text-align:center"> PL Allowance Entry </td></tr>
        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblAllowanceID" runat="server" CssClass="lbl" Text="Allowance ID :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtAllowanceID" runat="server" CssClass="txtBox" Enabled="false"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblSalaryMonth" runat="server" CssClass="lbl" Text="Salary Month :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtSalaryMonth" runat="server" CssClass="txtBox"></asp:TextBox></td>
        </tr>

        <tr>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblPBasic" runat="server" CssClass="lbl" Text="Present Basic :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtPBasic" runat="server" CssClass="txtBox" Enabled="false"></asp:TextBox></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblPLAmount" runat="server" CssClass="lbl" Text="PL Amount :"></asp:Label></td>
            <td class="tdheight" style="text-align: left"><asp:TextBox ID="txtPLAmount" runat="server" CssClass="txtBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:right;"><asp:Button ID="btnAllowanceEntry" runat="server" CssClass="myButton" Text="Allowance Entry" OnClick="btnAllowanceEntry_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>

        <tr class="tblheader"><td colspan="4" style="text-align:center"> PL Date Change </td></tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:center">
                <asp:GridView ID="dgvPLInfo" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No." Visible="false"><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="App ID" SortExpression="intApplicationId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblAppID" Width="50px" runat="server" Text='<%# (""+Eval("intApplicationId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Applied From Date" SortExpression="dateAppliedFromDate" HeaderStyle-HorizontalAlign="Center" Visible="false"><ItemTemplate>
                        <asp:TextBox ID="txtAppFromDate" Width="80px" runat="server" Text='<%# Eval("dateAppliedFromDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Applied To Date" SortExpression="dateAppliedToDate" HeaderStyle-HorizontalAlign="Center" Visible="false"><ItemTemplate>
                        <asp:TextBox ID="txtAppToDate" Width="80px" runat="server" Text='<%# Eval("dateAppliedToDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Approved From Date" SortExpression="dateApprovedFromDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtApproveFrom" Width="80px" runat="server" Text='<%# Eval("dateApprovedFromDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Approved To Date" SortExpression="dateApprovedToDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtApproveTo" Width="80px" runat="server" Text='<%# Eval("dateApprovedToDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Approved From" SortExpression="dateApprovedFromDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtApprFrom" Width="80px" runat="server" Text='<%# Eval("dateApprovedFromDate", "{0:dd-MM-yyyy}") %>' Enabled="false"></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField HeaderText="Approved To" SortExpression="dateApprovedToDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:TextBox ID="txtApprTo" Width="80px" runat="server" Text='<%# Eval("dateApprovedToDate", "{0:dd-MM-yyyy}") %>' Enabled="false"></asp:TextBox></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px"/></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Update" >
                        <ItemTemplate><asp:Button ID="btnUpdate" runat="server" Cssclass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intApplicationId")+","+ Container.DataItemIndex %>'    Text="Update" OnClick="btnUpdate_Click"/>
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