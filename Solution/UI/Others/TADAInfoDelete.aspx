<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TADAInfoDelete.aspx.cs" Inherits="UI.Others.TADAInfoDelete" %>

<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
          <script>
              $(document).ready(function () {
                  SearchText();
              });
              function Changed() {
                  document.getElementById('hdfSearchBoxTextChange').value = 'true';
              }
              function SearchText() {
                  $("#txtEmployee").autocomplete({
                      source: function (request, response) {
                          $.ajax({
                              type: "POST",
                              contentType: "application/json;",
                              url: "TADAInfoDelete.aspx/GetAutoCompleteData",
                              data: "{'strSearchKey':'" + document.getElementById('txtEmployee').value + "'}",
                              dataType: "json",
                              success: function (data) {
                                  response(data.d);
                              },
                              error: function (result) {
                                  alert("Error");
                              }
                          });
                      }
                  });
              }
</script>
        <script type="text/javascript">
            function Confirm() {
                document.getElementById("hdnconfirm").value = "0";
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
                if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
                else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
            }

</script>



</head>
<body>
    <form id="frmattendance" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>

    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left;">
        <asp:HiddenField ID="hdnunit" runat="server" />
         <asp:HiddenField ID="hdnsearch" runat="server" /> <asp:HiddenField ID="hdnconfirm" runat="server" />
        <tr class="tblheader"><td class="tdheader" colspan="4">TA DA Info Delete befor Supervisor Approve</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr> 
            <%--AutoPostBack="false" TextMode="Search"--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Employee Name : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEmployee" runat="server" CssClass="txtBox" AutoPostBack="true"  ></asp:TextBox><asp:HiddenField ID="hdfSearchBoxTextChange" runat="server" /></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnrol" CssClass="lbl" runat="server" Text="Enrol : "></asp:Label></td>
             <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnrolvalue" CssClass="lbl" runat="server"></asp:Label></td>
           </tr>

        <tr> 
            <%--AutoPostBack="false" TextMode="Search"--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblDesignation" CssClass="lbl" runat="server" Text="Designation : "></asp:Label></td>
            <td class="tdheight"><asp:Label ID="lblDesignationvalue" CssClass="lbl" runat="server"></asp:Label></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblUnit" CssClass="lbl" runat="server" Text="Unit : "></asp:Label></td>
             <td class="tdheight" style="text-align:right;"><asp:Label ID="lblUnitvalue" CssClass="lbl" runat="server"></asp:Label></td>
           </tr>


       
        <tr>
             <td style="text-align:right;"><asp:Label ID="lblbnkvdt" CssClass="lbl" runat="server" Text="Bill Date : "></asp:Label></td>
    <td><asp:TextBox ID="txtBnkVoucherDate" runat="server" CssClass="txtBox" Enabled="true"></asp:TextBox>
    <script type="text/javascript"> new datepickr('txtBnkVoucherDate', { 'dateFormat': 'Y-m-d' });</script></td>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblActiveStatus" CssClass="lbl" runat="server" Text="Bill  will be : "></asp:Label></td>
             <td class="tdheight" style="text-align:right;"><asp:DropDownList ID="ddlBillStatus" runat="server"  CssClass="ddList">
                 <asp:ListItem Enabled="true" Text="Active" Value="1"></asp:ListItem>
                 <asp:ListItem Enabled="true" Text="In - Active" Value="0"></asp:ListItem>
                                                            </asp:DropDownList></td>
        </tr>
         <tr>
              <td class="tdheight" colspan="1" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show" Width="120px" OnClick="btnShow_Click"/></td>      
             
            
        </tr>


        
    </table>
    </div>

        <div>
            <table>
                <tr>

                    
     
             
         </tr>  

               
            </table>

        </div>

        <div>
            <table>
                <tr>

                 <asp:GridView ID="dgdvTADAInfoDelt" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="false" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
                     <AlternatingRowStyle BackColor="#CCCCCC" />
                     <Columns>

                        <asp:TemplateField HeaderText="">
                    <EditItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/></EditItemTemplate>
                    <ItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/>
                    <asp:HiddenField ID="hdnenroll" runat="server" Value='<%# Eval("PkID") %>'/>
                    </ItemTemplate></asp:TemplateField>



                    <asp:TemplateField HeaderText="PK ID" SortExpression="PkID">
                    <ItemTemplate>
                    <asp:HiddenField   ID="hdBillDate"   runat="server" Value='<%# Bind("PkID", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtPkID"   CssClass="txtBox" runat="server" Width="35px" TextMode="SingleLine" ReadOnly="true"  Text='<%# Bind("PkID") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="60px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="From Date" SortExpression="dteFromDate">
                    <ItemTemplate>
                    <asp:HiddenField   ID="hddteFromdateNoBikeDet"   runat="server" Value='<%# Bind("dteFromdate", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="dteFromdateNoBikeDet"   CssClass="txtBox" runat="server" Width="150px" TextMode="Date"  Text='<%# Bind("dteFromdate") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="70px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee  Name" SortExpression="strEmplName">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdEmpName" runat="server"  Value='<%# Bind("strNam", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="strNamNoBikeDet" CssClass="txtBox" runat="server" Width="70px" TextMode="SingleLine" Text='<%# Bind("strNam") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="70px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Row Total" SortExpression="decrowtotal">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddecrowtotal" runat="server" Value='<%# Bind("decRowTotalT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecRowTotalT"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decRowTotalT") %>'></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                 
                    <asp:TemplateField HeaderText="Det.">
                    <ItemTemplate>
                 
                     <asp:Button ID="btnDeleteInfo" runat="server" Text="Submit" class="button" CommandName="complete" OnClick="btnDeleteInfo_Click"  CommandArgument='<%# Eval("PkID")%>'/></ItemTemplate>
                        
                         </asp:TemplateField>  
                    
                       
                         

                     

                     </Columns>
                     <FooterStyle BackColor="#CCCCCC" />
                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#808080" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#383838" />
                 </asp:GridView>


                </tr>
            </table>
        </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>