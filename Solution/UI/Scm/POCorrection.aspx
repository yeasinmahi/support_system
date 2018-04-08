﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POCorrection.aspx.cs" Inherits="UI.Scm.POCorrection" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
    <asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
    <webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
   
     <script language="javascript" type="text/javascript">
        function onlyNumbers(evt) {
            var e = event || evt; // for trans-browser compatibility
            var charCode = e.which || e.keyCode;

            if ((charCode > 57))
                return false;
            return true;
        }
    </script>
    <script type="text/javascript">

        $(function () {
            ////$("[id*=txtQty]").val("0");
        });

        $("[id*=txtQty]").live("change", function () {
            if (isNaN(parseFloat($(this).val()))) {
                $(this).val('0');
            } else { parseFloat($(this).val($(this).val()).toString()).toFixed(2); }
        });
        //*** txtQty Selection Change Start ****************************************************************************
        $("[id*=txtQty]").live("keyup", function () {
            if (!jQuery.trim($(this).val()) == '') {

                if (!isNaN(parseFloat($(this).val()))) {
                    var row = $(this).closest("tr");
                    $("[id*=lblTotalVal]", row).html((((parseFloat($("[id*=txtRate]", row).val()) + parseFloat($("[id*=txtVAT]", row).val()) + parseFloat($("[id*=lblAIT]", row).html()))) * ($(this).val())).toFixed(2));
                }
            } else {
                $(this).val('');
            }

            //var at = parseFloat($("[id*=lblAIT]", row).html());
            //var atc = $("[id*=lblAIT]", row).val();
            //var atch = $("[id*=lblAIT]", row).html();

            var grandTotal = 0;
            var grandTotalqty = 0;
            var grandTotalVat = 0;
            var grandTotalait = 0;

            $("[id*=lblTotalVal]").each(function () {
                grandTotal = grandTotal + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotal]").html(parseFloat(grandTotal.toString()).toFixed(2));

            $("[id*=lblAIT]").each(function () {
                grandTotalait = grandTotalait + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotalAIT]").html(grandTotalait.toString());

            $("[id*=txtQty]").each(function () {
                grandTotalqty = grandTotalqty + parseFloat($(this).val());
            });
            $("[id*=lblGrandTotalQty]").html(parseFloat(grandTotalqty.toString()).toFixed(2));

            $("[id*=txtVAT]").each(function () {
                grandTotalVat = grandTotalVat + parseFloat($(this).val());
            });
            $("[id*=lblGrandTotalVAT]").html(grandTotalVat.toString());
        });
        //*** txtQty Selection Change End ****************************************************************************        
        //*** txtRate Selection Change Start ****************************************************************************
        $(function () {
            ////$("[id*=txtRate]").val("0");
        });

        $("[id*=txtRate]").live("change", function () {
            if (isNaN(parseFloat($(this).val()))) {
                $(this).val('0');
            } else { parseFloat($(this).val($(this).val()).toString()).toFixed(2); }
        });

        $("[id*=txtRate]").live("keyup", function () {
            if (!jQuery.trim($(this).val()) == '') {

                if (!isNaN(parseFloat($(this).val()))) {
                    var row = $(this).closest("tr");
                    $("[id*=lblTotalVal]", row).html((parseFloat($("[id*=txtQty]", row).val()) * (parseFloat($(this).val()) + parseFloat($("[id*=txtVAT]", row).val()) + parseFloat($("[id*=lblAIT]", row).html()))).toFixed(2));
                }
            } else {
                $(this).val('');
            }

            var grandTotal = 0;
            var grandTotalqty = 0;
            var grandTotalVat = 0;
            var grandTotalait = 0;

            $("[id*=lblTotalVal]").each(function () {
                grandTotal = grandTotal + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotal]").html(parseFloat(grandTotal.toString()).toFixed(2));

            $("[id*=lblAIT]").each(function () {
                grandTotalait = grandTotalait + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotalAIT]").html(grandTotalait.toString());

            $("[id*=txtQty]").each(function () {
                grandTotalqty = grandTotalqty + parseFloat($(this).val());
            });
            $("[id*=lblGrandTotalQty]").html(grandTotalqty.toString());

            $("[id*=txtVAT]").each(function () {
                grandTotalVat = grandTotalVat + parseFloat($(this).val());
            });
            $("[id*=lblGrandTotalVAT]").html(grandTotalVat.toString());

        });
        //*** txtRate Selection Change End ****************************************************************************
        //*** txtVAT Selection Change Start ****************************************************************************
        $(function () {
            ////$("[id*=txtVAT]").val("0");
        });

        $("[id*=txtVAT]").live("change", function () {
            if (isNaN(parseFloat($(this).val()))) {
                $(this).val('0');
            } else { parseFloat($(this).val($(this).val()).toString()).toFixed(2); }
        });

        $("[id*=txtVAT]").live("keyup", function () {
            if (!jQuery.trim($(this).val()) == '') {

                if (!isNaN(parseFloat($(this).val()))) {
                    var row = $(this).closest("tr");
                    $("[id*=lblTotalVal]", row).html((parseFloat($("[id*=txtQty]", row).val()) * (parseFloat($(this).val()) + parseFloat($("[id*=txtRate]", row).val()) + parseFloat($("[id*=lblAIT]", row).html()))).toFixed(2));
                }
            } else {
                $(this).val('');
            }

            var grandTotal = 0;
            var grandTotalqty = 0;
            var grandTotalVat = 0;
            var grandTotalait = 0;

            $("[id*=lblTotalVal]").each(function () {
                grandTotal = grandTotal + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotal]").html(parseFloat(grandTotal.toString()).toFixed(2));

            $("[id*=lblAIT]").each(function () {
                grandTotalait = grandTotalait + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotalAIT]").html(grandTotalait.toString());

            $("[id*=txtQty]").each(function () {
                grandTotalqty = grandTotalqty + parseFloat($(this).val());
            });
            $("[id*=lblGrandTotalQty]").html(grandTotalqty.toString());

            $("[id*=txtVAT]").each(function () {
                grandTotalVat = grandTotalVat + parseFloat($(this).val());
            });
            $("[id*=lblGrandTotalVAT]").html(grandTotalVat.toString());
        });
        //*** txtVAT Selection Change End ****************************************************************************

</script>

    <script>

    function doSomething(){
    document.getElementById('id_confrmdiv').style.display="block"; //this is the replace of this line


    document.getElementById('id_truebtn').onclick = function(){
       //do your delete operation
        alert('true');
    };

    document.getElementById('id_falsebtn').onclick = function(){
         alert('false');
       return false;
    };
    }
</script>

    
</head>
<body>
    <form id="frmattendance" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>
    <asp:HiddenField ID="hdnconfirm" runat="server" /><asp:HiddenField ID="hdnWHID" runat="server" />
    <asp:HiddenField ID="hdnEnroll" runat="server" /><asp:HiddenField ID="hdnUnit" runat="server" />
    <asp:HiddenField ID="hdnPOUnit" runat="server" />

    <div class="leaveApplication_container">
    <table class="tbldecoration" style="width:auto; float:left;">
        <tr class="tblheader"><td class="tdheader" colspan="4"> PO CORRECTION :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="PO No. : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtPONo" runat="server" CssClass="txtBox" ></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label19" CssClass="lbl" runat="server" Text="Wear House : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtWH" runat="server" CssClass="txtBox" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox></td>                                
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnDeletePO" runat="server" class="myButton" Text="Delete PO" Width="120px" OnClientClick = "ConfirmAll()" OnClick="btnDeletePO_Click"/></td>
            <td colspan="2" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server" class="myButton" Text="Show" Width="120px" OnClick="btnShow_Click"/></td>            
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
        
        <tr>        
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" runat="server" Text="PO Type : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtPOType" runat="server" CssClass="txtBox" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox></td>        

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="MRR No. : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtMrrNo" runat="server" CssClass="txtBox" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox></td>
        </tr>
        <tr> 
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label8" CssClass="lbl" runat="server" Text="Supplier Name : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlSupplier" CssClass="ddList" Font-Bold="false" ForeColor="Black" Font-Size="11px" runat="server"></asp:DropDownList> </td>
            <%--<td class="tdheight"><asp:TextBox ID="txtSupplier" runat="server" CssClass="txtBox" Enabled="false" BackColor="WhiteSmoke" ></asp:TextBox></td>--%>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label10" CssClass="lbl" runat="server" Text="No of Shipment : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtNoofShipment" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label4" CssClass="lbl" runat="server" Text="Currency : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlCurrency" CssClass="ddList" Font-Bold="false" ForeColor="Black" Font-Size="11px" runat="server"></asp:DropDownList> </td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label11" CssClass="lbl" runat="server" Text="Last Shipment Date : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtLastShipmentDate" runat="server" CssClass="txtBox"></asp:TextBox>
            <script type="text/javascript"> new datepickr('txtLastShipmentDate', { 'dateFormat': 'Y-m-d' });</script></td>
        </tr> 
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="PO Date : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtPODate" runat="server" CssClass="txtBox" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox>
            <script type="text/javascript"> new datepickr('txtPODate', { 'dateFormat': 'Y-m-d' });</script></td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label12" CssClass="lbl" runat="server" Text="Payment terms : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlPaymentTerms" runat="server" CssClass="ddList">
            <asp:ListItem Selected="True" Value="1">Cash</asp:ListItem><asp:ListItem Value="2">Credit</asp:ListItem>
            <asp:ListItem Value="3">Advance</asp:ListItem></asp:DropDownList></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label6" CssClass="lbl" runat="server" Text="Transport Amount : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtTransport" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label13" CssClass="lbl" runat="server" Text="Payment days after MRR (days) : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtPaymentdaysAfterMRR" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label5" CssClass="lbl" runat="server" Text="Gross Discount : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtGDiscount" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label14" CssClass="lbl" runat="server" Text="No of Installment (for installment Payment) : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtNoOfInstallment" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label7" CssClass="lbl" runat="server" Text="Others Amount : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtOthers" runat="server" CssClass="txtBox" ></asp:TextBox></td>

            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label15" CssClass="lbl" runat="server" Text="Installment Interval (Days, for installment) : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtInstallmentIntervalDays" runat="server" CssClass="txtBox" ></asp:TextBox></td>
        </tr>
        <tr>  
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label9" CssClass="lbl" runat="server" Text="Partial Shipment : "></asp:Label></td>
            <td class="tdheight"><asp:DropDownList ID="ddlPartialShipment" runat="server" CssClass="ddList">
            <asp:ListItem Selected="True" Value="0">FALSE</asp:ListItem><asp:ListItem Value="1">TRUE</asp:ListItem></asp:DropDownList></td>
                  
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label16" CssClass="lbl" runat="server" Text="Destination For Delivery : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtDestinationForDelivery" runat="server" CssClass="txtBox" ></asp:TextBox></td>                              
        </tr>
        <tr> 
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label18" CssClass="lbl" runat="server" Text="Other Terms : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtOtherTerms" runat="server" CssClass="txtBox" Height="50px" TextMode="MultiLine"></asp:TextBox></td> 
             
            <td class="tdheight" style="text-align:right;"><asp:Label ID="Label17" CssClass="lbl" runat="server" Text="Warrenty after delivery (in months) : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtWarrentyAfterDelivery" runat="server" CssClass="txtBox" ></asp:TextBox></td>                                         
        </tr> 
        <tr>
            <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnUpdatePO" runat="server" class="myButton" Text="Update" Width="120px" OnClientClick = "ConfirmAll()" OnClick="btnUpdatePO_Click"/></td>        
        </tr>
        <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
                
    </table>
    </div>

    <div id="divItemInfo" runat="server" class="leaveApplication_container">     
        <table  class="tbldecoration" style="width:auto; float:left;">
            <%--<tr><td colspan="4" style="font-weight:bold; font-size:11px; color:#3369ff;">Item Description:<hr /></td></tr>--%>
            <%--<tr><td> <hr /> </td></tr>--%>
            <tr>
                <td>
                    <asp:GridView ID="dgvItemInfoByPO" runat="server" AutoGenerateColumns="False" AllowPaging="false" PageSize="8"
                    CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" ShowFooter="true" 
                    FooterStyle-BackColor="#808080" FooterStyle-ForeColor="White" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" ForeColor="Black" GridLines="Vertical" OnRowDataBound="dgvItemInfoByPO_RowDataBound" OnRowDeleting="dgvItemInfoByPO_RowDeleting" OnRowCommand="dgvItemInfoByPO_RowCommand">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                    <asp:TemplateField HeaderText="SL No."><ItemStyle HorizontalAlign="center" Width="60px" /><ItemTemplate> <%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
                                    
                    <asp:TemplateField HeaderText="Item ID" SortExpression="intemid" Visible="true">
                    <ItemTemplate><asp:Label ID="lblItemID" runat="server" Text='<%# Bind("intemid") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Left" Width="45px" /></asp:TemplateField>

                    <asp:TemplateField HeaderText="Item Name" SortExpression="itemname">
                    <ItemTemplate><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("itemname") %>' Width="230px"></asp:Label>
                    </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="230px" />
                    <FooterTemplate><asp:Label ID="lblT" runat="server" Text="Total" /></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="Item Specification" SortExpression="specification">
                    <ItemTemplate><asp:TextBox ID="txtSpecification" runat="server" CssClass="txtBox" Text='<%# Bind("specification") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </ItemTemplate><ItemStyle HorizontalAlign="left" Width="300px" />
                    <FooterTemplate><asp:Label ID="lblBlank" runat="server" Text=""></asp:Label></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="UOM" SortExpression="uom">
                    <ItemTemplate><asp:Label ID="lblUOM" runat="server" Text='<%# Bind("uom") %>'></asp:Label>
                    </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="40px" />
                    <FooterTemplate><asp:Label ID="lblT" runat="server" Text="" /></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity" SortExpression="qty">
                    <ItemTemplate><asp:TextBox ID="txtQty" runat="server" CssClass="txtBox" DataFormatString="{0:0.00}"  Text='<%# Bind("qty") %>' Width="60px"></asp:TextBox>
                    </ItemTemplate><ItemStyle HorizontalAlign="right" Width="60px" />
                    <FooterTemplate><asp:Label ID="lblGrandTotalQty" runat="server" DataFormatString="{0:0.00}" Text="<%# totalqty %>" /></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="Rate" ItemStyle-HorizontalAlign="right" SortExpression="rate">
                    <ItemTemplate><asp:TextBox ID="txtRate" runat="server" CssClass="txtBox" DataFormatString="{0:0.00}" Text='<%# Bind("rate") %>' Width="45px"></asp:TextBox>
                    </ItemTemplate><ItemStyle HorizontalAlign="right" Width="40px" />
                    <FooterTemplate><asp:Label ID="lbldm" runat="server" DataFormatString="{0:0.00}" Text="" /></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="VAT" SortExpression="vat">
                    <ItemTemplate><asp:TextBox ID="txtVAT" runat="server" CssClass="txtBox" DataFormatString="{0:0.00}" Text='<%# Bind("vat") %>' Width="45px"></asp:TextBox>
                    </ItemTemplate><ItemStyle HorizontalAlign="right" Width="45px" />
                    <FooterTemplate><asp:Label ID="lblGrandTotalVAT" runat="server" DataFormatString="{0:0.00}" Text="<%# totalvat %>" /></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="AIT" ItemStyle-HorizontalAlign="right" SortExpression="ait">
                    <ItemTemplate><asp:Label ID="lblAIT" runat="server" DataFormatString="{0:0.00}" Text='<%# (decimal.Parse(""+Eval("ait"))) %>'></asp:Label>
                    </ItemTemplate><ItemStyle HorizontalAlign="right" Width="40px" />
                    <FooterTemplate><asp:Label ID="lblGrandTotalAIT" runat="server" DataFormatString="{0:0.00}" Text="<%# totalait %>" /></FooterTemplate></asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Value" ItemStyle-HorizontalAlign="right" SortExpression="total">
                    <ItemTemplate><asp:Label ID="lblTotalVal" runat="server" DataFormatString="{0:0.00}" Text='<%# (decimal.Parse(""+Eval("total"))) %>'></asp:Label>
                    </ItemTemplate><ItemStyle HorizontalAlign="right" Width="80px" />
                    <FooterTemplate><asp:Label ID="lblGrandTotal" runat="server" DataFormatString="{0:0.00}" Text="<%# totalval %>" /></FooterTemplate></asp:TemplateField>
                                    
                    <asp:TemplateField HeaderText="Existing" SortExpression="ysnExisting" Visible="false">
                    <ItemTemplate><asp:Label ID="lblExisting" runat="server" Text='<%# Bind("ysnExisting") %>'></asp:Label>
                    </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="45px" /></asp:TemplateField>

                    <asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Center" SortExpression="">
                    <ItemTemplate><asp:Button ID="btnApprove" class="myButtonGrid" OnClientClick = "ConfirmAll()" CommandArgument="<%# Container.DataItemIndex %>" runat="server" CommandName="Y"  
                    Text="Update"/></ItemTemplate><ItemStyle HorizontalAlign="center"/></asp:TemplateField>
                        
                    <%--<asp:CommandField DeleteText="Update" HeaderText="Update" ShowDeleteButton="True" ControlStyle-Width="40px" ControlStyle-Font-Bold="true" ControlStyle-ForeColor="Blue"/>--%>

                    <%--<asp:TemplateField HeaderText="Indent No" SortExpression="indentno" Visible="true">
                    <ItemTemplate><asp:Label ID="lblIndentNo" runat="server" Text='<%# Bind("indentno") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Left" Width="45px" /></asp:TemplateField>

                    <asp:TemplateField HeaderText="PO Qty" SortExpression="poqty" Visible="true">
                    <ItemTemplate><asp:Label ID="lblPOQty" runat="server" Text='<%# Bind("poqty") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Left" Width="45px" /></asp:TemplateField>

                    <asp:TemplateField HeaderText="HS Code" SortExpression="hscode" Visible="true">
                    <ItemTemplate><asp:Label ID="lblHSCode" runat="server" Text='<%# Bind("hscode") %>'></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Left" Width="45px" /></asp:TemplateField>--%>

                    </Columns>
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:GridView></td>
                </tr>                               
            </table>
        </div>

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>