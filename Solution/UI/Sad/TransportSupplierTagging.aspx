<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportSupplierTagging.aspx.cs" Inherits="UI.Sad.TransportSupplierTagging" %>

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
             $("#txtSupplier").autocomplete({
                 source: function (request, response) {
                     $.ajax({
                         type: "POST",
                         contentType: "application/json;",
                         url: "TransportSupplierTagging.aspx/GetAutoCompleteData",
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
        <tr class="tblheader"><td class="tdheader" colspan="4">Supplier Tagging:</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr> 
            <%--AutoPostBack="false" TextMode="Search"--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Supplier Name : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtSupplier" runat="server" AutoPostBack="true" CssClass="txtBox"  ></asp:TextBox><asp:HiddenField ID="hdfSearchBoxTextChange" runat="server" /></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblUnitName" CssClass="lbl" runat="server" Text="Unit Name : "></asp:Label></td>
              <td class="tdheight"><asp:DropDownList ID="ddlUnitName" runat="server"  CssClass="ddList" DataSourceID="ODSUNIT" DataTextField="strUnit" DataValueField="intUnitID" ></asp:DropDownList>
                  <asp:ObjectDataSource ID="ODSUNIT" runat="server" SelectMethod="getUnitNamebyEnrol" TypeName="BLL.BLLSAD">
                      <SelectParameters>
                          <asp:SessionParameter Name="Enrol" SessionField="sesEnroll" Type="Int32" />
                      </SelectParameters>
                  </asp:ObjectDataSource>
            </td>
                
                 

            
        </tr>
        <tr>
              <td class="tdheight" colspan="1" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnSubmit" runat="server" class="myButton" Text="Submit" Width="120px" OnClientClick="Confirm()" OnClick="btnSubmit_Click"/></td> 
             <td class="tdheight" colspan="1" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show" Width="120px" OnClick="btnShow_Click"/></td>      
        </tr>
        
    </table>
    </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>