<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ERPPermission.aspx.cs" Inherits="UI.HR.ERPPermission" %>

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
    <script type="text/javascript">
      function Search_dgvservice(strKey, strGV) {

          var strData = strKey.value.toLowerCase().split(" ");
          var tblData = document.getElementById(strGV);
          var rowData;
          for (var i = 1; i < tblData.rows.length; i++) {
              rowData = tblData.rows[i].innerHTML;
              var styleDisplay = 'none';
              for (var j = 0; j < strData.length; j++) {
                  if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                      styleDisplay = '';
                  else {
                      styleDisplay = 'none';
                      break;
                  }
              }
              tblData.rows[i].style.display = styleDisplay;
          }

      }
        </script>

</head>
<body>
    <form id="frmEmpUpdate" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <asp:HiddenField ID="hdnconfirm" runat="server" />

    <div class="leaveApplication_container">

    <table class="tbldecoration" style="width:auto; float:left; ">
        <tr class="tblheader"><td colspan="4" style="text-align:center"> ERP PERMISSION </td><asp:HiddenField ID="hdnempid" runat="server"/></tr>
        <tr class="tblheader"><td style=" height:1px; background-color:#c1bdbd;" colspan="4"> </td></tr>

        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnroll" CssClass="lbl" runat="server" Text="Enroll : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEnroll" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblType" CssClass="lbl" runat="server" Text="Permission Type : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlType" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"><asp:ListItem Selected="True" Value="1">ERP Login Permission</asp:ListItem>
                <asp:ListItem Value="2">ERP Menu Permission</asp:ListItem><asp:ListItem Value="3">Unit Permission</asp:ListItem>
                <asp:ListItem Value="4">Job Station Permission</asp:ListItem></asp:DropDownList></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblUnit" runat="server" CssClass="lbl" Text="Unit :"></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlUnit" runat="server" CssClass="ddList" AutoPostBack="true" OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged"></asp:DropDownList></td>
            <td class="tdheight" style="text-align:right"><asp:Label ID="lblJobStation" runat="server" CssClass="lbl" Text="Job Station :"></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlJobStation" runat="server" CssClass="ddList"></asp:DropDownList></td>
        </tr>

        <tr>
            <td class="tdheight" colspan="3" style="text-align:right;"><asp:Button ID="btnShow" runat="server" CssClass="myButton" Text="Show" OnClick="btnShow_Click" /></td>
            <td class="tdheight" style="text-align:right;"><asp:Button ID="btnSubmit" runat="server" CssClass="myButton" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>

        <tr>
            <td class="tdheight" colspan="4" style="text-align:center">
                <asp:GridView ID="dgvPermission" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="ID" SortExpression="intRoleID" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblID" runat="server" Text='<%# (""+Eval("intRoleID")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Main Menu" SortExpression="strFuncParent" HeaderStyle-HorizontalAlign="Center">
                            <HeaderTemplate> 
                        <asp:TextBox ID="TxtServiceConfg" runat="server"  width="100" ForeColor="Black"  placeholder="Search" onkeyup="Search_dgvservice(this, 'dgvPermission')"></asp:TextBox></HeaderTemplate>

                        <ItemTemplate><asp:Label ID="lblMainMenu" runat="server" Text='<%#  Bind("strFuncParent") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sub Menu" SortExpression="strFunc" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblSubMenu" runat="server" Text='<%#  Bind("strFunc") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description" SortExpression="strDescription" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:Label ID="lblDescription" runat="server" Text='<%#  Bind("strDescription") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Permission" SortExpression="ysnEnable" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:CheckBox ID="chkPermission" runat="server" Checked='<%#  Bind("ysnEnable") %>'></asp:CheckBox></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status" SortExpression="ysnEnable" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate><asp:CheckBox ID="chkStatus" runat="server" Checked='<%#  Bind("ysnEnable") %>' Enabled="false"></asp:CheckBox></ItemTemplate>
                        </asp:TemplateField>
                        
                        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:center">
                <asp:GridView ID="dgvUnitList" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="intUnitID" SortExpression="intUnitID" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblUnitID" runat="server" Text='<%# (""+Eval("intUnitID")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Unit" SortExpression="strUnit" HeaderStyle-HorizontalAlign="Center">
                            <HeaderTemplate> 
                        <asp:TextBox ID="TxtServiceConfg" runat="server"  width="100" ForeColor="Black"  placeholder="Search" onkeyup="Search_dgvservice(this, 'dgvUnitList')"></asp:TextBox></HeaderTemplate>
                        <ItemTemplate><asp:Label ID="lblUnit" runat="server" Text='<%#  Bind("strUnit") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete" >
                        <ItemTemplate><asp:Button ID="btnUnitDelete" runat="server" Cssclass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intUnitID")+","+ Container.DataItemIndex %>'    Text="Delete" OnClick="btnUnitDelete_Click"/>
                        </ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>
                        
                        </Columns><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="tdheight" colspan="4" style="text-align:center">
                <asp:GridView ID="dgvJobStation" runat="server" AutoGenerateColumns="False" AllowPaging="False" PageSize="8"
                CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ><AlternatingRowStyle BackColor="#CCCCCC" />
                
                        <Columns>

                        <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="15px"/><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>

                        <asp:TemplateField HeaderText="intJobStationId" SortExpression="intJobStationId" HeaderStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate><asp:Label ID="lblJSID" runat="server" Text='<%# (""+Eval("intJobStationId")) %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="50px" /></asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Job Station" SortExpression="strJobStationName" HeaderStyle-HorizontalAlign="Center">
                            <HeaderTemplate> 
                        <asp:TextBox ID="TxtServiceConfg" runat="server"  width="100" ForeColor="Black"  placeholder="Search" onkeyup="Search_dgvservice(this, 'dgvJobStation')"></asp:TextBox></HeaderTemplate>
                        <ItemTemplate><asp:Label ID="lblStation" runat="server" Text='<%#  Bind("strJobStationName") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete" >
                        <ItemTemplate><asp:Button ID="btnStationDelete" runat="server" Cssclass="myButton" style="cursor:pointer; font-size:11px;" 
                        CommandArgument='<%# Eval("intJobStationId")+","+ Container.DataItemIndex %>'    Text="Delete" OnClick="btnStationDelete_Click"/>
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