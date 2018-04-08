<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemApprovalByPurchase.aspx.cs" Inherits="UI.Scm.ItemApprovalByPurchase" %>
<!DOCTYPE html>
<html>
<head runat="server"><title></title>   
    <asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
    <webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />

    <style type="text/css"> 
    .rounds { height: 200px; width: 150px; -moz-border-colors:25px; border-radius:25px;} 
    .hdnDivision { background-color: #EFEFEF; position:absolute;z-index:1; visibility:hidden; border:10px double black; text-align:center;
    width:500%; height: 18%; margin-left:50px; margin-top: 00px; margin-right:00px; padding: 15px; overflow-y:scroll;}    
    </style>

</head>
<body>
    <form id="frmattendance" runat="server"> 
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%--=========== Start Code =====================================================================--%>
    <asp:HiddenField ID="hdnconfirm" runat="server" /><asp:HiddenField ID="hdnWHID" runat="server" />
    <asp:HiddenField ID="hdnEnroll" runat="server" /><asp:HiddenField ID="hdnUnit" runat="server" />
    <asp:HiddenField ID="hdnItemID" runat="server" />


    <div id="hdnDivision" class="hdnDivision" style="width:auto;"><table style="width:auto; float:left; ">            
    <tr><td colspan="4" style="text-align:right; font:bold 14px verdana;"><a class="button" onclick="ClosehdnDivision('1')" title="Close" style="cursor:pointer;text-align:right; color:red; font:bold 10px verdana;">X</a></td></tr>
    <tr><td>
        <div class="leaveApplication_container">
        <table class="tbldecoration" style="width:auto; float:left;">
        
            <tr class="tblheader"><td class="tdheader" colspan="4"> ITEM APPROVE BY PURCHASE DEPT :</td></tr>        
            <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
            <tr ><td style="padding: 15px 0px 0px 5px;" colspan="4"> </td></tr>
            <tr>        
                <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Item Base Name : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtItemBaseName" runat="server" CssClass="txtBox" BackColor="WhiteSmoke" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>        

                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label5" CssClass="lbl" runat="server" Text="Item Description : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtItemDes" runat="server" CssClass="txtBox" BackColor="WhiteSmoke" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td> 
            </tr>        
            <tr>
                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label11" CssClass="lbl" runat="server" Text="Procure Type"></asp:Label><span style="color:red; font-size:14px;">*</span><span> :</span></td>            
                <td class="tdheight"><asp:DropDownList ID="ddlProcureType" runat="server" CssClass="ddList" AutoPostBack="false">
                <asp:ListItem Selected="True" Value="1">Local</asp:ListItem><asp:ListItem Value="2">Import</asp:ListItem>
                <asp:ListItem Value="3">Common</asp:ListItem></asp:DropDownList></td>        

                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label6" CssClass="lbl" runat="server" Text="HS Code : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtHSCode" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            </tr>
            <%--<tr>
                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label1" CssClass="lbl" runat="server" Text="PO Processing Time (In Days) : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtPOProcessing" runat="server" CssClass="txtBox" ></asp:TextBox></td>

                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label2" CssClass="lbl" runat="server" Text="Supplier Delivery Time (In Days) : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtSupplierDelivery" runat="server" CssClass="txtBox" ></asp:TextBox></td>
            </tr>--%>
            <tr>
                <%--<td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="Processing Time For GR (In Days) : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtProcessingTimeGR" runat="server" CssClass="txtBox" ></asp:TextBox></td>--%>

                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label3" CssClass="lbl" runat="server" Text="Total Lead Time (In Days) : "></asp:Label></td>
                <td class="tdheight"><asp:TextBox ID="txtTotalLeadTime" runat="server" CssClass="txtBox" ></asp:TextBox></td>

                <td class="tdheight" style="text-align:right;"><asp:Label ID="Label4" CssClass="lbl" runat="server" Text="SDE Classification : "></asp:Label></td>            
                <td class="tdheight"><asp:DropDownList ID="ddlSDEClassification" runat="server" CssClass="ddList" AutoPostBack="false">
                <asp:ListItem Selected="True" Value="1">Scare</asp:ListItem><asp:ListItem Value="2">Difficult</asp:ListItem>
                <asp:ListItem Value="3">Easy Availability</asp:ListItem></asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnApprove" runat="server" class="myButton" Text="Approve" OnClientClick = "ConfirmAll()" OnClick="btnApprove_Click"/></td>
            </tr>
        </table>
        </div> 
    </td></tr>
    </table>
    </div>       
        
    <table class="tbldecoration" style="width:auto; float:left;">   
        <tr><td colspan="5"><hr /></td></tr>     
        <tr class="tblheader"><td class="tdheader" colspan="4" style ="min-width:685px;"> ITEM DETAILS :</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        

        <tr class="tblrowodd"><td colspan="4">
        <asp:GridView ID="dgvItem" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="8"
        CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"  OnRowCommand="dgvItem_RowCommand" ><AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
        <asp:TemplateField HeaderText="SL." ItemStyle-HorizontalAlign="Center"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>        
        <%--<asp:BoundField DataField="intAutoID" HeaderText="intAutoID" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="intAutoID">
        <ItemStyle HorizontalAlign="Left" Width="50px"/></asp:BoundField>--%>

        <asp:TemplateField HeaderText="intAutoID" SortExpression="itemname" Visible="false">
        <ItemTemplate><asp:Label ID="lblAutoID" runat="server" Text='<%# Bind("intAutoID") %>' Width="50px"></asp:Label>
        </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="50px" /></asp:TemplateField>

        <asp:BoundField DataField="strWareHoseName" HeaderText="Ware House Name" ItemStyle-HorizontalAlign="Center" SortExpression="strWareHoseName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strLocationName" HeaderText="Location" ItemStyle-HorizontalAlign="Center" SortExpression="strLocationName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
            
        <%--<asp:TemplateField HeaderText="Item Name New" SortExpression="itemname">
        <ItemTemplate><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("strItemName") %>' Width="230px"></asp:Label>
        </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="230px" /></asp:TemplateField>--%>

        <%--<asp:BoundField DataField="strItemName" HeaderText="Item Name" ItemStyle-HorizontalAlign="Center" SortExpression="strItemName" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="300px"/></asp:BoundField>
        <asp:BoundField DataField="strDescription" HeaderText="Description" ItemStyle-HorizontalAlign="Center" SortExpression="strDescription">
        <ItemStyle HorizontalAlign="Left" Width="300px"/></asp:BoundField>--%>
        
        <asp:TemplateField HeaderText="Item Name" SortExpression="strItemName">
        <ItemTemplate><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("strItemName") %>' Width="200px"></asp:Label>
        </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="200px" /></asp:TemplateField>

        <asp:TemplateField HeaderText="Description" SortExpression="strDescription">
        <ItemTemplate><asp:Label ID="lblDescription" runat="server" Text='<%# Bind("strDescription") %>' Width="200px"></asp:Label>
        </ItemTemplate><ItemStyle HorizontalAlign="Left" Width="200px" /></asp:TemplateField> 
                    
        <asp:BoundField DataField="strPart" HeaderText="Part No." ItemStyle-HorizontalAlign="Center" SortExpression="strPart">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strUOM" HeaderText="UOM" ItemStyle-HorizontalAlign="Center" SortExpression="strUOM">
        <ItemStyle HorizontalAlign="Left" Width="80px"/><HeaderStyle HorizontalAlign="Center" /></asp:BoundField>
        <asp:BoundField DataField="strItemType" HeaderText="Item Type" ItemStyle-HorizontalAlign="Center" SortExpression="strItemType" HeaderStyle-HorizontalAlign="Center">
        <ItemStyle HorizontalAlign="Left" Width="100px"/></asp:BoundField>
        
        <%--<asp:BoundField DataField="strCluster" HeaderText="Old Cluster" ItemStyle-HorizontalAlign="Center" SortExpression="strCluster">
        <ItemStyle HorizontalAlign="Left" Width="130px"/></asp:BoundField>
        <asp:BoundField DataField="strCommodity" HeaderText="Old Commodity" ItemStyle-HorizontalAlign="Center" SortExpression="strCommodity">
        <ItemStyle HorizontalAlign="Left" Width="170px"/></asp:BoundField>
        <asp:BoundField DataField="strCategory" HeaderText="Old Category" ItemStyle-HorizontalAlign="Center" SortExpression="strCategory">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>--%>
            
        <asp:BoundField DataField="strNewCluster" HeaderText="Cluster" ItemStyle-HorizontalAlign="Center" SortExpression="strCluster">
        <ItemStyle HorizontalAlign="Left" Width="130px"/></asp:BoundField>
        <asp:BoundField DataField="strNewCommodity" HeaderText="Commodity" ItemStyle-HorizontalAlign="Center" SortExpression="strCommodity">
        <ItemStyle HorizontalAlign="Left" Width="170px"/></asp:BoundField>
        <asp:BoundField DataField="strNewCategory" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="strCategory">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
                    
        <asp:BoundField DataField="strBrand" HeaderText="Brand" ItemStyle-HorizontalAlign="Center" SortExpression="strBrand">
        <ItemStyle HorizontalAlign="Left" Width="130px"/></asp:BoundField>
        <asp:BoundField DataField="strMinorCat" HeaderText="Minor Category" ItemStyle-HorizontalAlign="Center" SortExpression="strMinorCat">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
        <asp:BoundField DataField="strPlant" HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="strPlant">
        <ItemStyle HorizontalAlign="Left" Width="200px"/></asp:BoundField>
         
        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" SortExpression="">
        <ItemTemplate><asp:Button ID="btnApprove" class="myButton" runat="server" CommandName="Y" Font-Size="9px" 
        CommandArgument="<%# Container.DataItemIndex %>" Text="Select"/></ItemTemplate><ItemStyle HorizontalAlign="Left"/></asp:TemplateField>
        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" SortExpression="">
        <ItemTemplate><asp:Button ID="btnReject" class="myButton" OnClientClick = "ConfirmAll()" runat="server" CommandName="R" Font-Size="9px" 
        CommandArgument="<%# Container.DataItemIndex %>" Text="Reject"/></ItemTemplate><ItemStyle HorizontalAlign="Left"/></asp:TemplateField>

        <%--<asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Center" SortExpression="">
        <ItemTemplate><asp:Button ID="btnApprove" class="myButtonGrid" OnClientClick = "ConfirmAll()" CommandArgument="<%# Container.DataItemIndex %>" runat="server" CommandName="Y"  
        Text="Update"/></ItemTemplate><ItemStyle HorizontalAlign="center"/></asp:TemplateField>--%>
            
        </Columns>
        <FooterStyle BackColor="#CCCCCC" /><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" /><SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" /> <SortedAscendingHeaderStyle BackColor="#808080" /><SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </td></tr>

    </table>
    

<%--=========== End Code =====================================================================--%>
     
    </form>
</body>
</html>