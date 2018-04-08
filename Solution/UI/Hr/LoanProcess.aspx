<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanProcess.aspx.cs" Inherits="UI.HR.LoanProcess" %>

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
        <asp:HiddenField ID="hdnAppID" runat="server"/>
    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> Loan Proccess </td>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" colspan="3" style="text-align:left;"><asp:Button ID="btnShow" runat="server" CssClass="myButton" Text="Show" OnClick="btnShow_Click" /></td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>
        </Table>
        </div>
        <div>
        <Table>
        <tr>
            <td class="tdheight" style="text-align:center">
                <asp:GridView ID="dgvLoan" runat="server" AutoGenerateColumns="False" AllowPaging="False"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="ID" SortExpression="intLoanApplicationId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblID" Width="50px" runat="server" Text='<%# (""+Eval("intLoanApplicationId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Enroll" SortExpression="intEmployeeId" HeaderStyle-HorizontalAlign="Center" Visible="false"><ItemTemplate>
                        <asp:Label ID="lblEnroll" Width="50px" runat="server" Text='<%# Bind("intEmployeeId") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Name" SortExpression="strEmployeeName" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblName" Width="100px" runat="server" Text='<%# Bind("strEmployeeName") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="100px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Loan Amount" SortExpression="intLoanAmount" HeaderStyle-HorizontalAlign="Center" Visible="false"><ItemTemplate>
                        <asp:Label ID="lblLoanAmount" Width="40px" runat="server" Text='<%# Bind("intLoanAmount") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Approved Amount" SortExpression="intApproveLoanAmount" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblApprovedAmount" Width="40px" runat="server" Text='<%# Bind("intApproveLoanAmount") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Number of Installment" SortExpression="intNumberOfInstallment" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblNumberInstallment" Width="40px" runat="server" Text='<%# Bind("intNumberOfInstallment") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Cleared Installment" SortExpression="InstallmentCleared" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblClearedInstallment" Width="40px" runat="server" Text='<%# Bind("InstallmentCleared") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Remaining Installment" SortExpression="RemainingInstallment" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblRemainingInstallment" Width="40px" runat="server" Text='<%# Bind("RemainingInstallment") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Effective Date" SortExpression="dteEffectiveDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblDate" Width="75px" runat="server" Text='<%# Eval("dteEffectiveDate", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="75px" /></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Details">
                        <ItemTemplate><asp:Button ID="btnDetails" runat="server" Cssclass="myButton" style="cursor:pointer;font-size:11px;text-align:left;" 
                        CommandArgument='<%# Eval("intLoanApplicationId")+","+ Container.DataItemIndex %>'    Text="Details" OnClick="btnDetails_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="center" Width="50px"/></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="left" HeaderText="Complete" >
                        <ItemTemplate><asp:Button ID="btnComplte" runat="server" Cssclass="myButton" style="cursor:pointer; font-size:11px; text-align:left" 
                        CommandArgument='<%# Eval("intLoanApplicationId")+","+ Container.DataItemIndex %>'    Text="Complete" OnClick="btnComplete_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="center" Width="50px"/></asp:TemplateField>
                        
                        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:center">
                <asp:GridView ID="dgvLoanDetails" runat="server" AutoGenerateColumns="False" AllowPaging="False"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="ID" SortExpression="intScheduleId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblID" Width="50px" runat="server" Text='<%# (""+Eval("intScheduleId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Month" SortExpression="intMonth" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblMonth" Width="50px" runat="server" Text='<%# Bind("intMonth") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="50px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Year" SortExpression="intYear" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblYear" Width="40px" runat="server" Text='<%# Bind("intYear") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Amount" SortExpression="intInstallmentAmount" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblAmount" Width="40px" runat="server" Text='<%# Bind("intInstallmentAmount") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="40px" /></asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" SortExpression="dteInstallmentDate" HeaderStyle-HorizontalAlign="Center"><ItemTemplate>
                        <asp:Label ID="lblDate" Width="75px" runat="server" Text='<%# Eval("dteInstallmentDate", "{0:dd-MM-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="75px" /></asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete" >
                        <ItemTemplate><asp:Button ID="btnDelete" runat="server" Cssclass="myButton" style="cursor:pointer;font-size:11px;text-align:left;" 
                        CommandArgument='<%# Eval("intScheduleId")+","+ Container.DataItemIndex %>'    Text="Delete" OnClick="btnDelete_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="center"  /></asp:TemplateField>

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