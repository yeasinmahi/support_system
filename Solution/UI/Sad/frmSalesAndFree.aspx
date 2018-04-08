<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSalesAndFree.aspx.cs" Inherits="UI.Sad.frmSalesAndFree" %>

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
      <script>
         $(document).ready(function () {
             SearchText();
         });
         function Changed() {
             document.getElementById('hdfSearchBoxTextChange').value = 'true';
         }
         function SearchText() {
             $("#txtSearchCustomer").autocomplete({
                 source: function (request, response) {
                     $.ajax({
                         type: "POST",
                         contentType: "application/json;",
                         url: "OrderChange.aspx/GetAutoCompleteData",
                         data: '{"strSearchKey":"' + document.getElementById('txtSearchCustomer').value + '"}',
                         dataType: "json",
                         success: function (data) {
                             response(data.d);
                         },
                         error: function (result) {

                         }
                     });
                 }
             });
         }
    </script>

</head>
<body>
    <form id="frmSalesAndFree" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>
        <asp:HiddenField ID="HdfSearchbox" runat="server" />
        <asp:HiddenField ID="hdnProduct" runat="server" /><asp:HiddenField ID="hdnProductID" runat="server" />
   <asp:HiddenField ID="hdnPrice" runat="server" />
         <div class="leaveApplication_container">
       <table><tr><td>
        <table class="tbldecoration" style="width:auto; float:left;">
        
        <tr class="tblheader"><td class="tdheader" colspan="4">PROMOTION INACTIVE SINGLE CUSTOMER :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Line : "></asp:Label></td>
        <td class="tdheight"> <asp:DropDownList ID="ddlLine" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlLine_SelectedIndexChanged" >
        <asp:ListItem Value="1">A</asp:ListItem>
        <asp:ListItem Value="2">B</asp:ListItem>
        <asp:ListItem Value="3">D</asp:ListItem>
        <asp:ListItem Value="7">Corp</asp:ListItem>
        <asp:ListItem Value="4">Export</asp:ListItem>
        </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="Item Name : "></asp:Label></td>
        <td class="tdheight"><asp:DropDownList ID="ddlItem" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" ></asp:DropDownList></td>
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;"><asp:Label ID="lblitm" CssClass="lbl" Font-Size="small" runat="server" Text="Distributor List : "></asp:Label></td>
        <td class="tdheight">
        <asp:TextBox ID="txtSearchCustomer"  Class="autocomplete_completionListElement" runat="server"  width="400" BorderColor="Green" CssClass="txtBox" onchange="javascript: Changed();"  ></asp:TextBox></td>        

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
        <asp:GridView ID="dgvDistibutorSummary" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" Font-Size="10px" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px" /><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
            
       
       
        <asp:TemplateField HeaderText="Product Id" SortExpression="Region">
        <ItemTemplate><asp:Label ID="lblintPromProductId" runat="server" Text='<%# Bind("intPromProductId") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="70px"/></asp:TemplateField>
     
              
        <asp:TemplateField HeaderText="Product Name" SortExpression="strArea">
        <ItemTemplate><asp:Label ID="lblstrProductName" runat="server" Text='<%# Bind("strProductName") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="left" Width="100px"/></asp:TemplateField>

        <asp:TemplateField HeaderText="Prom Quentity" SortExpression="strTerritory">
        <ItemTemplate><asp:Label ID="lblnumPromQuentity" runat="server" Text='<%# Bind("numPromQuentity") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="70px"/></asp:TemplateField>


        <asp:TemplateField HeaderText="Start Date" SortExpression="strOutletName">
        <ItemTemplate><asp:HiddenField ID="hdnintid" runat="server" Value='<%# Bind("intid") %>' />
        <asp:Label ID="lbldtestarttime" runat="server" Text='<%# Bind("dtestarttime") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="170px"/></asp:TemplateField>


        <asp:TemplateField HeaderText="End Date" SortExpression="strOutletName">
        <ItemTemplate><asp:HiddenField ID="hdndteendtime" runat="server" Value='<%# Bind("dteendtime") %>' />
        <asp:Label ID="lbldteendtimes" runat="server" Text='<%# Bind("dteendtime") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="170px"/></asp:TemplateField>




        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="" ControlStyle-ForeColor="Blue" >
        <ItemTemplate><asp:Button ID="btnAction" runat="server" class="nextclick" OnCommand="btnAction_OnCommand" CommandName="Inactive" style="cursor:pointer; font-size:11px;" 
        CommandArgument='<%# Eval("intid") %>' Text="Inactive"/>
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
        
              
        <tr class="tblheader"><td class="tdheader" colspan="4">PROMOTION INACTIVE BY REGION :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Line : "></asp:Label></td>
        <td class="tdheight"> <asp:DropDownList ID="ddlrline" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlLine_SelectedIndexChanged" >
        <asp:ListItem Value="1">A</asp:ListItem>
        <asp:ListItem Value="2">B</asp:ListItem>
        <asp:ListItem Value="3">D</asp:ListItem>
        <asp:ListItem Value="7">Corp</asp:ListItem>
        <asp:ListItem Value="4">Export</asp:ListItem>
        </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" runat="server" Text="Item Name : "></asp:Label></td>
        <td class="tdheight"><asp:DropDownList ID="ddlRitem" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" ></asp:DropDownList></td>
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label4" CssClass="lbl" Font-Size="small" runat="server" Text="Distributor List : "></asp:Label></td>
        <td class="tdheight">
        <asp:DropDownList ID="DDLREGION" runat="server"></asp:DropDownList>
        </td>        

        <td class="tdheight" style="text-align:right;"></td>
        <td class="tdheight"></td>        
        </tr>
        <tr>
        <td class="tdheight" style="text-align:right;">From Date:</td>
        <td class="tdheight">
        <asp:TextBox ID="txtfDate" runat="server" CssClass="txtBox"></asp:TextBox>
        <script type="text/javascript"> new datepickr('txtfDate', { 'dateFormat': 'Y-m-d' });</script></td>        

        <td class="tdheight" style="text-align:right;">To Date:</td>
        <td class="tdheight"><asp:TextBox ID="txttDate" runat="server" CssClass="txtBox"></asp:TextBox>
        <script type="text/javascript"> new datepickr('txttDate', { 'dateFormat': 'Y-m-d' });</script></td>        
        </tr>
        <tr>
        <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px">
        <asp:Button ID="Button1" runat="server" class="myButton" Text="Show" OnClick="btnShowRegion_Click" />
        <asp:Button ID="btnInactive" runat="server" class="myButton" Text="Inactive" OnClick="btnRegionSubmit" />

        </td>
        </tr>
        <tr>
        <td class="tdheight" colspan="6" style="text-align:right;">
        <asp:GridView ID="dgvRegionRpt" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" Font-Size="10px" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px" /><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
            
          
        <asp:TemplateField HeaderText="Customer Name" SortExpression="Region">
        <ItemTemplate><asp:Label ID="lblCustname" runat="server" Text='<%# Bind("strName") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="70px"/></asp:TemplateField>
  
       
        <asp:TemplateField HeaderText="Product Id" SortExpression="Region">
        <ItemTemplate><asp:Label ID="lblintPromProductId" runat="server" Text='<%# Bind("intPromProductId") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="70px"/></asp:TemplateField>
     
              
        <asp:TemplateField HeaderText="Product Name" SortExpression="strArea">
        <ItemTemplate><asp:Label ID="lblstrProductName" runat="server" Text='<%# Bind("strProductName") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="left" Width="100px"/></asp:TemplateField>

        <asp:TemplateField HeaderText="Prom Quentity" SortExpression="strTerritory">
        <ItemTemplate><asp:Label ID="lblnumPromQuentity" runat="server" Text='<%# Bind("numPromQuentity") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="70px"/></asp:TemplateField>


        <asp:TemplateField HeaderText="Start Date" SortExpression="strOutletName">
        <ItemTemplate><asp:HiddenField ID="hdnintid" runat="server" Value='<%# Bind("intid") %>' />
        <asp:Label ID="lbldtestarttime" runat="server" Text='<%# Bind("dtestarttime") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="170px"/></asp:TemplateField>


        <asp:TemplateField HeaderText="End Date" SortExpression="strOutletName">
        <ItemTemplate><asp:HiddenField ID="hdndteendtime" runat="server" Value='<%# Bind("dteendtime") %>' />
        <asp:Label ID="lbldteendtimes" runat="server" Text='<%# Bind("dteendtime") %>'></asp:Label></ItemTemplate>
        <ItemStyle HorizontalAlign="right" Width="170px"/></asp:TemplateField>


        <asp:TemplateField HeaderText=""><EditItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/></EditItemTemplate>
        <ItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="true"/>
        </ItemTemplate></asp:TemplateField>



        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:GridView>
        </td>
          
              
        </tr>
        </table>
        </td></tr>
        <tr><td>
        <table class="tbldecoration" style="width:100%; float:left;">      
        <tr class="tblheader"><td class="tdheader" colspan="4">ACL Purchase Voucher Create :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr>        
        <td class="tdheight" style="text-align:right;"><asp:Label ID="Label5" CssClass="lbl" runat="server" Text="Unit Name: "></asp:Label></td>
        <td class="tdheight"> <asp:DropDownList ID="ddlunit" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlLine_SelectedIndexChanged" >
        <asp:ListItem Value="16">DTI</asp:ListItem>
        <asp:ListItem Value="10">AMFL</asp:ListItem>
        <asp:ListItem Value="11">AZML</asp:ListItem>
       
        </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>
        </tr>
        
        <tr>
        <td class="tdheight" style="text-align:right;">Challan Date:</td>
        <td class="tdheight">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="txtBox"></asp:TextBox>
        <script type="text/javascript"> new datepickr('txtfDate', { 'dateFormat': 'Y-m-d' });</script></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">
        <script type="text/javascript"> new datepickr('txttDate', { 'dateFormat': 'Y-m-d' });</script></td>        
        </tr>
        <tr>
        <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px">
        <asp:Button ID="Button2" runat="server" class="myButton" Text="Create" OnClick="btnVoucherCreate_Click" />

        </td>
        </tr>
        <tr>
        <td class="tdheight" colspan="6" style="text-align:right;">
        &nbsp;</td>
          
              
        </tr>
        </table>
        </td></tr>
        <tr><td>
        <table class="tbldecoration" style="width:100%; float:left;">      
        <tr class="tblheader"><td class="tdheader" colspan="4">ACL Delivery Challan Hit To Ledger:</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
         <tr>
        <td class="tdheight" style="text-align:right;">ACL Challan:</td>
        <td class="tdheight">
        <asp:TextBox ID="txtChallanno" runat="server" CssClass="txtBox"></asp:TextBox> </td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">
        <script type="text/javascript"> new datepickr('txttDate', { 'dateFormat': 'Y-m-d' });</script></td>        
        </tr>
        <tr>        
        <td class="tdheight" style="text-align:right;">DTI Challan No:</td>
        <td class="tdheight"> <asp:Label ID="lblDTIChallan" runat="server"></asp:Label></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>
        </tr>


        
       
        <tr>
        <td colspan="4" style="text-align:center; padding: 10px 0px 0px 0px"><asp:Label ID="lblACLChallanos" runat="server"></asp:Label> </td>
        </tr>
             <tr>        
        <td class="tdheight" style="text-align:right;">Purchase Unit:</td>
        <td class="tdheight"> <asp:DropDownList ID="ddlU" runat="server" CssClass="ddList" AutoPostBack="True" OnSelectedIndexChanged="ddlLine_SelectedIndexChanged" >
        <asp:ListItem Value="16">DTI</asp:ListItem>
        <asp:ListItem Value="10">AMFL</asp:ListItem>
        <asp:ListItem Value="11">AZML</asp:ListItem>
       
        </asp:DropDownList></td>        

        <td class="tdheight" style="text-align:right;">&nbsp;</td>
        <td class="tdheight">&nbsp;</td>
        </tr>
        <tr>
        <td class="tdheight" colspan="6" style="text-align:right;">
        <asp:Button ID="Button3" runat="server" class="myButton" Text="Show" OnClick="btnACLCHallanshow_Click" />
        <asp:Button ID="btnNewChallan" runat="server" class="myButton" Text="New Challan Create" OnClick="btnNewChallanCreate_Click" />
        </td>
          
              
        </tr>
        </table>
            </td></tr></table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>