<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HallRoomBookingCancelAfterAprv.aspx.cs" Inherits="UI.Others.HallRoomBookingCancelAfterAprv" %>

<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
<asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
<webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
           <%-- <script type="text/javascript">
            $(document).ready(function () {
                SearchText();
            });
            function Changed() {
                document.getElementById('hdfSearchBoxTextChange').value = 'true';
            }
            function SearchText() {
                $("#txtSupplier").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json;",
                            url: "~/Scripts/WebForms/Customize/PointService.asmx/GetAutoCompletecustomer",
                            data: "{'strSearchKey':'" + document.getElementById('txtSupplier').value + "'}",
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


    </script>--%>

 <%--   <script>
        $(document).ready(function () {
            document.getElementById('All').style.display = 'block';

            $("#<%=txtSupplier.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/Scripts/WebForms/Customize/PointService.asmx/GetAutoCompletecustomer") %>',
                        data: '{"station":"' + $("#hdnunit").val() + '","searchKey":"' + request.term + '"}',
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) { response($.map(data.d, function (item) { return { label: item.split('^')[0], val: item.split('^')[0] } })) },
                        error: function (response) { alert(response.responseText); },
                        failure: function (response) { alert(response.responseText); }
                    });
                },
                select: function (e, i) {
                    $("#<%=hdnsearch.ClientID %>").val(i.item.val);
                }, minLength: 1
            });


    </script>--%>
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
        <tr class="tblheader"><td class="tdheader" colspan="4">Hall Booking Cancel After HR Aprove</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr> 
            <%--AutoPostBack="false" TextMode="Search"--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Enry Number : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtpkid" runat="server" CssClass="txtBox"  ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnrol" CssClass="lbl" runat="server" Text="Enrol : "></asp:Label></td>
             <td class="tdheight" style="text-align:right;"><asp:Label ID="lblEnrolvalue" CssClass="lbl" runat="server"></asp:Label></td>
           </tr>

        <tr> 
            <%--AutoPostBack="false" TextMode="Search"--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblName" CssClass="lbl" runat="server" Text="Name : "></asp:Label></td>
            <td class="tdheight"><asp:Label ID="lblNamevalue" CssClass="lbl" runat="server"></asp:Label></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblUnit" CssClass="lbl" runat="server" Text="Unit : "></asp:Label></td>
             <td class="tdheight" style="text-align:right;"><asp:Label ID="lblUnitvalue" CssClass="lbl" runat="server"></asp:Label></td>
           </tr>


       
     
         <tr>
              <td class="tdheight" colspan="1" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show" Width="120px" OnClick="btnShow_Click"/></td>      
             
            
        </tr>


        
    </table>
    </div>

        <div>
            <table>
                <tr>

                    
             <td>
                 <asp:GridView ID="grdvforCancelHallBooking" runat="server" AutoGenerateColumns="False" PageSize="5" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" HeaderStyle-Wrap="true" OnRowDataBound="grdvforCancelHallBooking_RowDataBound" GridLines="Vertical">
                     <AlternatingRowStyle BackColor="#CCCCCC" />
                     <Columns>
                       
                    <asp:TemplateField HeaderText="">
                    <EditItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/></EditItemTemplate>
                    <ItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/>
                    <asp:HiddenField ID="hdnenroll" runat="server" Value='<%# Eval("pkid") %>'/>
                    </ItemTemplate></asp:TemplateField>

                   <%-- <asp:BoundField DataField="Id" HeaderText="Sl" SortExpression="intid" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>--%>


                    <asp:TemplateField HeaderText="PK ID" SortExpression="PkID">
                    <ItemTemplate>
                    <asp:HiddenField   ID="hdBillDate"   runat="server" Value='<%# Bind("PkID", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtPkID"   CssClass="txtBox" runat="server" Width="50px" TextMode="SingleLine" ReadOnly="true"  Text='<%# Bind("PkID") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                    </asp:TemplateField>

                          <asp:BoundField DataField="hallname" HeaderText="Hall Name" SortExpression="strOilCreditStationName" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                          <asp:BoundField DataField="bookingdate" HeaderText="Booking Date" SortExpression="strOilCreditStationName" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                          <asp:TemplateField HeaderText="Det.">
                    <ItemTemplate>
                 
                     <asp:Button ID="btnDeleteInfo" runat="server" Text="Delete" class="button" CommandName="complete" OnClick="btnDeleteInfo_Click"  CommandArgument='<%# Eval("pkid")%>'   /></ItemTemplate>
                        
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
             </td>
             
         </tr>  

               
            </table>

        </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>