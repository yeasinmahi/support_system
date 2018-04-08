<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TADAInfoUpdate.aspx.cs" Inherits="UI.Others.TADAInfoUpdate" %>

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
                         url: "TADAInfoUpdate.aspx/GetAutoCompleteData",
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

      <script type="text/javascript">
           
            $("[id*=txtdecCostPetrolT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);
                         
                    }
                } else {
                    $(this).val('');
                }
            });
               
        
            $("[id*=txtdecCostOctenT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecCostCarbonNitGasT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtlubricantcost]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFareBusAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFareRickshawAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFareCNGAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFareTrainAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFareAirPlaneT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFareOtherVheicleAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecCostAmountMaintenaceT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecFeryTollCostT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecDAAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecDriverDACostT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecHotelBillAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecDriverHotelBillAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecPhotoCopyCostT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecCourierCostT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
            $("[id*=txtdecOtherBillAmountT]").live("keyup", function () {
                if (!jQuery.trim($(this).val()) == '') {

                    if (!isNaN(parseFloat($(this).val()))) {
                        var row = $(this).closest("tr");

                        var petrol = parseFloat($("[id*=txtdecCostPetrolT]", row).val());
                        var oct = parseFloat($("[id*=txtdecCostOctenT]", row).val());
                        var CarbonNitGas = parseFloat($("[id*=txtdecCostCarbonNitGasT]", row).val());
                        var lubr = parseFloat($("[id*=txtlubricantcost]", row).val());
                        var Bus = parseFloat($("[id*=txtdecFareBusAmountT]", row).val());
                        var Rick = parseFloat($("[id*=txtdecFareRickshawAmountT]", row).val());
                        var cng = parseFloat($("[id*=txtdecFareCNGAmountT]", row).val());
                        var train = parseFloat($("[id*=txtdecFareTrainAmountT]", row).val());
                        var air = parseFloat($("[id*=txtdecFareAirPlaneT]", row).val());
                        var othvhcl = parseFloat($("[id*=txtdecFareOtherVheicleAmountT]", row).val());
                        var mnt = parseFloat($("[id*=txtdecCostAmountMaintenaceT]", row).val());
                        var fertol = parseFloat($("[id*=txtdecFeryTollCostT]", row).val());
                        var ownda = parseFloat($("[id*=txtdecDAAmountT]", row).val());
                        var drvda = parseFloat($("[id*=txtdecDriverDACostT]", row).val());
                        var owhhotl = parseFloat($("[id*=txtdecHotelBillAmountT]", row).val());
                        var drvhotl = parseFloat($("[id*=txtdecDriverHotelBillAmountT]", row).val());
                        var phcopy = parseFloat($("[id*=txtdecPhotoCopyCostT]", row).val());
                        var courier = parseFloat($("[id*=txtdecCourierCostT]", row).val());
                        var other = parseFloat($("[id*=txtdecOtherBillAmountT]", row).val());

                        var grandtotal = petrol + oct + CarbonNitGas + lubr + Bus + Rick + cng + train + air + othvhcl + mnt + fertol + ownda + drvda + owhhotl + drvhotl + phcopy + courier + other;

                        //alert(parseFloat($("[id*=txtdecRowTotalT]", row).val(grandtotal)));

                        $("[id*=txtdecRowTotalT]", row).val(grandtotal);

                    }
                } else {
                    $(this).val('');
                }
            });
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
        <tr class="tblheader"><td class="tdheader" colspan="4">TA DA Info Update</td></tr>        
        <tr class="tblheader"><td style=" height:2px; background-color:#c1bdbd;" colspan="4"> </td></tr>
        <tr> 
            <%--AutoPostBack="false" TextMode="Search"--%>
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lbltotalmanpower" CssClass="lbl" runat="server" Text="Employee Name : "></asp:Label></td>
            <td class="tdheight"><asp:TextBox ID="txtEmployee" runat="server" AutoPostBack="true" CssClass="txtBox"  ></asp:TextBox><asp:HiddenField ID="hdfSearchBoxTextChange" runat="server" /></td>        

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
            <td class="tdheight" style="text-align:right;"><asp:Label ID="lblGrand" CssClass="lbl" runat="server" Text="Total : "></asp:Label></td>
             <td class="tdheight" style="text-align:right;"><asp:Label ID="lblGrandTotal" CssClass="lbl" runat="server"></asp:Label></td>
        </tr>
         <tr>
              <td class="tdheight" colspan="1" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnShow" runat="server"  class="myButton" Text="Show" Width="120px" OnClick="btnShow_Click"/></td>      
              <td class="tdheight" colspan="1" style="text-align:right; padding: 10px 0px 0px 0px"><asp:Button ID="btnSubmit" runat="server" class="myButton" Visible="false" Text="Submit" Width="120px" OnClientClick="Confirm()" OnClick="btnSubmit_Click"/></td> 
            
        </tr>


        
    </table>
    </div>

        <div>
            <table>
                <tr>

                    
             <td>
                 <asp:GridView ID="grdvForUpdateTADABikeCarUser" runat="server" AutoGenerateColumns="False" PageSize="5" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" HeaderStyle-Wrap="true" OnRowDataBound="grdvForUpdateTADABikeCarUser_RowDataBound" GridLines="Vertical">
                     <AlternatingRowStyle BackColor="#CCCCCC" />
                     <Columns>
                       
                    <asp:TemplateField HeaderText="">
                    <EditItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/></EditItemTemplate>
                    <ItemTemplate><asp:CheckBox ID="chkbx" runat="server" Checked="false"/>
                    <asp:HiddenField ID="hdnenroll" runat="server" Value='<%# Eval("pkrowsl") %>'/>
                    </ItemTemplate></asp:TemplateField>

                   <%-- <asp:BoundField DataField="Id" HeaderText="Sl" SortExpression="intid" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>--%>


                    <asp:TemplateField HeaderText="PK ID" SortExpression="PkID">
                    <ItemTemplate>
                    <asp:HiddenField   ID="hdBillDate"   runat="server" Value='<%# Bind("PkID", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtPkID"   CssClass="txtBox" runat="server" Width="35px" TextMode="SingleLine" ReadOnly="true"  Text='<%# Bind("PkID") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
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

                    <asp:TemplateField HeaderText="Start Mlg" SortExpression="decstarmil">
                    <ItemTemplate>

                    <asp:HiddenField  ID="hdstartmilage"  runat="server" Value='<%# Bind("decStartMilageT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecStartMilageT"  CssClass="txtBox" runat="server" Width="50px"  Text='<%# Bind("decStartMilageT") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                    </asp:TemplateField>
                      
                    <asp:TemplateField HeaderText="End Mlg" SortExpression="decEndmil">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdEndmilage" runat="server" Value='<%# Bind("decEndMilageT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecEndMilageT"   CssClass="txtBox" runat="server" Width="50px"  Text='<%# Bind("decEndMilageT") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cons Mlg" SortExpression="consumedkm">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdConsumedkm" runat="server" Value='<%# Bind("decConsumedKmT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecConsumedKmT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decConsumedKmT") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Supporting" SortExpression="strsuppor">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdstrsuppor" runat="server" Value='<%# Bind("strSupportingNoT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtstrSupportingNoT"  CssClass="txtBox" runat="server" Width="50px" TextMode="MultiLine" Text='<%# Bind("strSupportingNoT") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qnt Petrol" SortExpression="decpet">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdQpetr"  runat="server" Value='<%# Bind("decQntPetrolT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecQntPetrolT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decQntPetrolT") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cost Petrol" SortExpression="costpet">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdnCostpetr" runat="server" Value='<%# Bind("decCostPetrolT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecCostPetrolT"    CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCostPetrolT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qnt Octen" SortExpression="decQntOcten">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdQntOcten" runat="server" Value='<%# Bind("decQntOctenT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecQntOctenT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decQntOctenT") %>'></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cost Octen" SortExpression="decCostOcten">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdCostocte" runat="server" Value='<%# Bind("decCostOctenT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecCostOctenT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCostOctenT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qnt CNG" SortExpression="decQntCNG">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdQCNG" runat="server" Value='<%# Bind("decQntCarbonNitGasT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecQntCarbonNitGasT"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decQntCarbonNitGasT") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cost CNG." SortExpression="CostCNG">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdCostcng" runat="server" Value='<%# Bind("decCostCarbonNitGasT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecCostCarbonNitGasT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCostCarbonNitGasT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qnt lubr" SortExpression="decQntLubricant">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdQlubricantt" runat="server" Value='<%# Bind("decLubricantQnt", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecQntLubricant"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decLubricantQnt") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cost Lubr." SortExpression="decCostLubricant">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdCostLubricant" runat="server" Value='<%# Bind("lubricantcost", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtlubricantcost"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("lubricantcost") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bus" SortExpression="decBus">
                    <ItemTemplate>

                    <asp:HiddenField  ID="hdBus"  runat="server" Value='<%# Bind("decFareBusAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFareBusAmountT"    CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFareBusAmountT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                      
                    <asp:TemplateField HeaderText="Rick" SortExpression="decRick">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdnRick" runat="server" Value='<%# Bind("decFareRickshawAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFareRickshawAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFareRickshawAmountT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Taxi Cab" SortExpression="decTaxiCab">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdtaxicab" runat="server" Value='<%# Bind("decFareCNGAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFareCNGAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFareCNGAmountT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>


                          <asp:TemplateField HeaderText="Train" SortExpression="decTaxiCab">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdTrain" runat="server" Value='<%# Bind("decFareTrainAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFareTrainAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFareTrainAmountT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                   
                          <asp:TemplateField HeaderText="Air" SortExpression="decFareAirPlaneT">
                    <ItemTemplate>
                    <asp:HiddenField  ID="hdAir" runat="server" Value='<%# Bind("decFareAirPlaneT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFareAirPlaneT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFareAirPlaneT") %>' ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Other Vhc." SortExpression="decOtherVhc">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdothevh" runat="server" Value='<%# Bind("decFareOtherVheicleAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFareOtherVheicleAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFareOtherVheicleAmountT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                  
           
                    <asp:TemplateField HeaderText="Mnt. Cost" SortExpression="decMnt">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdMntcost" runat="server" Value='<%# Bind("decCostAmountMaintenaceT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecCostAmountMaintenaceT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCostAmountMaintenaceT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ferry Toll." SortExpression="ferytol">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdoFerrytoll" runat="server" Value='<%# Bind("decFeryTollCostT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecFeryTollCostT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decFeryTollCostT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
              
                         
                         
                                   

                    <asp:TemplateField HeaderText="Own DA." SortExpression="decownda">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddecownda" runat="server" Value='<%# Bind("decDAAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecDAAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decDAAmountT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Driver DA." SortExpression="decDriver">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddecOtherda" runat="server" Value='<%# Bind("decDriverDACostT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecDriverDACostT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decDriverDACostT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Own Hotel" SortExpression="decownhotel">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddechotel" runat="server" Value='<%# Bind("decHotelBillAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecHotelBillAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decHotelBillAmountT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Driver Hotel" SortExpression="decdrivhotel">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddrivehote" runat="server" Value='<%# Bind("decDriverHotelBillAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecDriverHotelBillAmountT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decDriverHotelBillAmountT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                   
                    <asp:TemplateField HeaderText="Photo copy" SortExpression="decPhotocopy">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdPhotocpy" runat="server" Value='<%# Bind("decPhotoCopyCostT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecPhotoCopyCostT"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decPhotoCopyCostT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Courier" SortExpression="decCourier">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddCourier" runat="server" Value='<%# Bind("decCourierCostT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecCourierCostT"   CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCourierCostT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>


                     
                    <asp:TemplateField HeaderText="Other Cost" SortExpression="decOtherCostAmount">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddecOtherCostAmount" runat="server" Value='<%# Bind("decOtherBillAmountT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecOtherBillAmountT"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decOtherBillAmountT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                     
                    <asp:TemplateField HeaderText="Row Total" SortExpression="decrowtotal">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hddecrowtotal" runat="server" Value='<%# Bind("decRowTotalT", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecRowTotalT"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decRowTotalT") %>'  ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="RowSl" SortExpression="pkrowsl">
                    <ItemTemplate>
                    <asp:HiddenField   ID="hdRowSl"   runat="server" Value='<%# Bind("pkrowsl", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtRowSl"   CssClass="txtBox" runat="server" Width="35px" TextMode="SingleLine" ReadOnly="true"  Text='<%# Bind("pkrowsl") %>' AutoPostBack="true"></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

              
                  
                    <asp:TemplateField HeaderText="CNG Credit1 Amount" SortExpression="decCngCredit1Amont">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdndecCngCredit1Amont" runat="server" Value='<%# Bind("decCngCredit1Amont", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecSupplierCNG"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCngCredit1Amont") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                     
             
                   <asp:BoundField DataField="strCredit1StationName" HeaderText="CNG Credit1 StationName" SortExpression="strCredit1StationName" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                      <asp:TemplateField HeaderText="Gas Station 1"><ItemTemplate><asp:DropDownList ID="ddlCreditFuelStation1List" runat="server" CssClass="ddList" Width="150px" AutoPostBack="false">
                </asp:DropDownList></ItemTemplate></asp:TemplateField>


                   <asp:TemplateField HeaderText="CNG Credit2 Amount" SortExpression="decCngCredit2Amont">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdnCNGCredit2Amount" runat="server" Value='<%# Bind("decCngCredit2Amont", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtCNGCredit2AMNT"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decCngCredit2Amont") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                     
                  

                    <asp:BoundField DataField="strCredit2StationName" HeaderText="CNG Credit2 StationName" SortExpression="strCredit2StationName" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Gas Station 2"><ItemTemplate><asp:DropDownList ID="ddlCreditFuelStation2List" runat="server" CssClass="ddList" Width="150px" AutoPostBack="false">
                </asp:DropDownList></ItemTemplate></asp:TemplateField>


                   <asp:TemplateField HeaderText="Oil Credit1 Amount" SortExpression="decOilCreditAmount">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdndecOilCreditAmount" runat="server" Value='<%# Bind("decOilCreditAmount", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtOilCreditAmnt"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decOilCreditAmount") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                   <asp:BoundField DataField="strOilCreditStationName" HeaderText="Oil Credit StationName" SortExpression="strOilCreditStationName" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>


                <asp:TemplateField HeaderText="Oil Station"><ItemTemplate><asp:DropDownList ID="ddlCreditFuelStation3List" runat="server" CssClass="ddList" Width="150px" AutoPostBack="false">
                </asp:DropDownList></ItemTemplate></asp:TemplateField>

                  <asp:TemplateField HeaderText="PMlg Qnt" SortExpression="decPersonalMilage">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdndecPersonalMilage" runat="server" Value='<%# Bind("decPersonalMilage", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecPersonalMilage"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decPersonalMilage") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>
                         

                    <asp:TemplateField HeaderText=" Mlg. Rate" SortExpression="decMlgRate">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdndecMlgRate" runat="server" Value='<%# Bind("decMlgRate", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecMlgRate"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decMlgRate") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                         
                    


                    <asp:TemplateField HeaderText="P Mlag Total" SortExpression="decPersonalTotalcost">

                    <ItemTemplate>
                    <asp:HiddenField  ID="hdndecPersonalTotalcost" runat="server" Value='<%# Bind("decPersonalTotalcost", "{0:0.0}") %>'></asp:HiddenField>
                    <asp:TextBox ID="txtdecPersonalTotalcost"  CssClass="txtBox" runat="server" Width="35px"  Text='<%# Bind("decPersonalTotalcost") %>' AutoPostBack="true" ></asp:TextBox></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Det.">
                    <ItemTemplate>
                 
                     <asp:Button ID="btnUpdateinf" runat="server" Text="Update" class="button" CommandName="complete" OnClick="btnUpdateinf_Click"  CommandArgument='<%# Eval("pkrowsl")+","+Eval("PkID")%>'   /></ItemTemplate>
                        
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