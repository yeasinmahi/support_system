<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAFBLMarketUserPermission.aspx.cs" Inherits="UI.Sad.frmAFBLMarketUserPermission" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />

    <link href="../Content/Css/AutoComplete.css" rel="stylesheet" />
    <script src="../Scripts/WebForms/MSAjax/jquery-ui-1.8.20.js"></script>
    <script src="../Scripts/WebForms/MSAjax/jquery-ui-1.8.20.min.js"></script>
    <script src="../Scripts/WebForms/MSAjax/jquery-ui-1.8.22.custom.min.js"></script>
     
</head>
<body>
    <form id="frmSoftwarepermission" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>
        <asp:HiddenField ID="HdfSearchbox" runat="server" />
        <asp:HiddenField ID="hdnProduct" runat="server" /><asp:HiddenField ID="hdnProductID" runat="server" />
        <asp:HiddenField ID="hdnPrice" runat="server" />
        <div class="leaveApplication_container">
            <table><tr><td>
        <table class="tbldecoration" style="width:auto; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> AFBL SOFTWARE PERMISSION :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Line Management : "></asp:Label></td>
        <td class="tdheight"> <asp:DropDownList ID="ddlEmpDeg" runat="server" CssClass="ddList" AutoPostBack="True" >
        <asp:ListItem Value="3">Territory</asp:ListItem>
        <asp:ListItem Value="2">Area</asp:ListItem>
        <asp:ListItem Value="4">Point</asp:ListItem>
        <asp:ListItem Value="1">Region</asp:ListItem>
        </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>
        </tr>
        <tr>
           
        <td class="tdheight" style="text-align:right;"><asp:Label ID="lblitm" CssClass="lbl" Font-Size="small" runat="server" Text="Employee Enroll : "></asp:Label></td>
        <td class="tdheight">
        <asp:TextBox ID="txtEmpEnroll"  Class="autocomplete_completionListElement" runat="server"  width="400" BorderColor="Green" CssClass="txtBox"  OnTextChanged="txtEmpEnroll_TextChanged"  ></asp:TextBox></td>        

        <td class="tdheight" style="text-align:right;"></td>
        <td class="tdheight"></td>        
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">
        &nbsp;</td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>        
        </tr>
        <tr>
        <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show" OnClick="btnShow_Click" /></td>
        </tr>
        <tr>
        <td class="tdheight" colspan="6" style="text-align:right;">
        <asp:GridView ID="dgvEmployee" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" Font-Size="10px" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px" /><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
            
       
        <asp:TemplateField HeaderText="Enroll" Visible="false" ItemStyle-HorizontalAlign="right" SortExpression="Routeid" >
        <ItemTemplate><asp:Label ID="lblintEmpID" runat="server" Text='<%# (""+Eval("intEmpID")) %>'></asp:Label></ItemTemplate></asp:TemplateField>
      
        <asp:TemplateField HeaderText="Geo id" SortExpression="Region">
        <ItemTemplate><asp:Label ID="lblintgeoid" runat="server" Text='<%# Bind("intgeoid") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="70px"/></asp:TemplateField>
     
              
        <asp:TemplateField HeaderText="Location" SortExpression="strArea">
        <ItemTemplate><asp:Label ID="lblLocations" runat="server" Text='<%# Bind("Locations") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="left" Width="100px"/></asp:TemplateField>

        <asp:TemplateField HeaderText="From Date" SortExpression="strTerritory">
        <ItemTemplate><asp:Label ID="lbldteFromDate" runat="server" Text='<%# Bind("dteFromDate") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="70px"/></asp:TemplateField>


        <asp:TemplateField HeaderText="End Date" SortExpression="strOutletName">
        <ItemTemplate><asp:HiddenField ID="hdnintid" runat="server" Value='<%# Bind("intAutoID") %>' />
        <asp:Label ID="lbldteToDate" runat="server" Text='<%# Bind("dteToDate") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="170px"/></asp:TemplateField>

        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="" ControlStyle-ForeColor="Blue" >
        <ItemTemplate><asp:Button ID="btnAction" runat="server" class="nextclick" OnCommand="btnAction_OnCommand" CommandName="Inactive" style="cursor:pointer; font-size:11px;" 
        CommandArgument='<%# Eval("intAutoID") %>' Text="Active"/>
        </ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>


        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:GridView>
        </td>
          
              
        </tr>
        </table>
        </td></tr>
        <tr><td>

        <table class="tbldecoration" style="width:100%; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4"> &nbsp;SALES.AKIJ.NET PERMISSION (ACR,APBM):-</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Permission Group : "></asp:Label></td>
        <td class="tdheight"> <asp:DropDownList ID="ddltypes" runat="server" CssClass="ddList" AutoPostBack="True" >
        <asp:ListItem Value="1">Head_office</asp:ListItem>
        <asp:ListItem Value="2">Sales</asp:ListItem>
        <asp:ListItem Value="3">Distributor</asp:ListItem>
        <asp:ListItem Value="4">Factory</asp:ListItem>
        </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>
        </tr>
        <tr>
           
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" Font-Size="small" runat="server" Text="Employee Enroll/Customer Id : "></asp:Label></td>
        <td class="tdheight"><asp:TextBox ID="txtenrollid" CssClass="txtBox" runat="server"></asp:TextBox>
        </td>        

        <td class="tdheight" style="text-align:right;"></td>
        <td class="tdheight"></td>        
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;">Email:</td>
        <td class="tdheight"><asp:TextBox ID="txtemails" CssClass="txtBox" runat="server"></asp:TextBox>
        &nbsp;</td>        
       <tr>
        <td class="tdheight" style="text-align:right;">Unit:</td>
        <td class="tdheight"><asp:DropDownList ID="ddlunit" runat="server" CssClass="ddList" AutoPostBack="True" >
        </asp:DropDownList>

        &nbsp;</td> 
        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>        
        </tr>
        <tr>
        <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="Button1" runat="server" class="myButton" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
        <tr>
        <td class="tdheight" colspan="6" style="text-align:right;">
        
        </td>   
        </tr>
        </table>
        </td>

        </tr>
        <tr><td>
        <table class="tbldecoration" style="width:100%; float:left;">
        <tr class="tblheader"><td class="tdheader" colspan="4"> &nbsp;CUSTOMER VS JOBSTATION BRIDGE:-</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight"> &nbsp;</td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>
        </tr>
        <tr>
           
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label4" CssClass="lbl" Font-Size="small" runat="server" Text="Customer Id : "></asp:Label></td>
        <td class="tdheight"><asp:TextBox ID="txtCustid" CssClass="txtBox" runat="server"></asp:TextBox>
        </td>        

        <td class="tdheight" style="text-align:right;"></td>
        <td class="tdheight"></td>        
        </tr>
       <tr>
        <td class="tdheight" style="text-align:right;"></td>
        <td class="tdheight">&nbsp;</td>        
        </tr>
        <tr>
        <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="Button2" runat="server" class="myButton" Text="Show" OnClick="btnJobShow_Click" />
            <asp:Button ID="btnDelete" runat="server" class="myButton" Text="Delete" OnClick="btnDelete_OnCommand" />
        </td>
        </tr>
        <tr>
        <td class="tdheight" colspan="6" style="text-align:right;">
        <asp:GridView ID="dgvJVSC" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" Font-Size="10px" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px" /><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
            
       
        <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="right" SortExpression="Routeid" >
        <ItemTemplate><asp:Label ID="lblstrCName" runat="server" Text='<%# (""+Eval("strCName")) %>'></asp:Label></ItemTemplate></asp:TemplateField>
      
        <asp:TemplateField HeaderText="Jobstation Name" SortExpression="Region">
        <ItemTemplate><asp:HiddenField ID="hdnintid" runat="server" Value='<%# Bind("intCusId") %>' />
        <asp:Label ID="lblstrPName" runat="server" Text='<%# Bind("strPName") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="70px"/></asp:TemplateField>
     
      
        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:GridView>
        </td>
          
              
        </tr>
        </table>
                </td>

        </tr>
            </table>

    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>