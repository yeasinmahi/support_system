function ViewConfirm(id) { document.getElementById('hdnDivision').style.visibility = 'visible'; }
function ClosehdnDivision(sts) {
    if (sts == '1') { $("#hdnDivision").fadeOut("slow"); }
    else { alert(sts); $("#hdnDivision").fadeOut("slow"); }

}
function PopupwindowcloseReload() { window.close(); window.onbeforeunload = ReloadParent(); }
function ReloadParent() { if (window.opener != null && !window.opener.closed) { window.opener.location.reload();}}
function CheckGeoValidation() {
    document.getElementById("hdnconfirm").value = "0";
    var accuracy = document.forms["frmownpnch"]["hdnaccuracy"].value;
    var distance = document.forms["frmownpnch"]["hdndistance"].value; // In a meter
    if (accuracy == "" || accuracy > 100) {
        alert("Must be filled by valid station accuracy.");
    }
    else if (distance == "" || distance > 100) {
        alert("You are not in range. Max range is 100 meter.");
    }
    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
    }
}
function ConfirmAll() {
    document.getElementById("hdnconfirm").value = "0";
    var confirm_value = document.createElement("INPUT");
    confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
    if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
    else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
}
function DisplayLoadingDiv() { document.getElementById('dvDisable').style.visibility = 'visible'; }
function HideLoadingDiv() { document.getElementById('dvDisable').style.visibility = 'hidden'; }
function PurchaseReturnConfirm() {
    document.getElementById("hdnconfirm").value = "0";
    var txtCode = document.forms["frmpurrtnrcv"]["txtCode"].value;
    var txtVehicleno = document.forms["frmpurrtnrcv"]["txtVehicleno"].value;
    var txtDate = document.forms["frmpurrtnrcv"]["txtDate"].value;
    if (txtCode == null || txtCode == "") {
        alert("Please enter challan no.");
    }
    else if (txtDate == null || txtDate == "") {
        alert("Please enter valid purchase date.");
    }
    else if (txtVehicleno == null || txtVehicleno == "") {
        alert("Please enter vehicleno.");
    }
    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
    }
}
function ConfirmMRtn()
{
    document.getElementById("hdnconfirm").value = "0";
    var txtReason = document.forms["frmmrtn"]["txtReason"].value;
    var txtDate = document.forms["frmmrtn"]["txtDate"].value;
    if (txtReason == null || txtReason == "") {
        alert("Please enter reason details.");
    }
    else if (txtDate == null || txtDate == "") {
        alert("Please enter valid receive date.");
    }
    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
    }
}
function CheckSalesInValidation() {
    document.getElementById("hdnconfirm").value = "0";
    var txtTotalMemo = document.forms["frmslsinpoint"]["txtTotalMemo"].value;
    var txtNewMemo = document.forms["frmslsinpoint"]["txtNewMemo"].value;
    if (txtTotalMemo == null || txtTotalMemo == "" || isNaN(txtTotalMemo)) {
        alert("Please enter total memo numeric.");
    }
    else if (txtNewMemo == null || txtNewMemo == "" || isNaN(txtNewMemo)) {
        alert("Please enter new memo numeric.");
    }
    else {
        document.getElementById("hdnconfirm").value = "1";
    }
}

function CheckLeaveValidation() {
    document.getElementById("hdnconfirm").value = "0";
    var txtDteFrom = document.forms["frmppleave"]["txtFromdate"].value;
    var txtDteTo = document.forms["frmppleave"]["txtTodate"].value;
    if (txtDteFrom == null || txtDteFrom == "") {
        alert("From date must be filled by valid formate (yyyy-MM-dd).");
        document.getElementById("txtFromdate").focus();
    }
    else if (txtDteTo == null || txtDteTo == "") {
        alert("To date must be filled by valid formate (yyyy-MM-dd).");
        document.getElementById("txtTodate").focus();
    }
    else if (txtDteFrom > txtDteTo) {
        alert("To date must be greater than from date.");
        document.getElementById("txtTodate").focus();
    }
    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
    }
}
function CheckMovementValidation() {
    document.getElementById("hdnconfirm").value = "0";
    var txtDteFrom = document.forms["frmppmove"]["txtFromdate"].value;
    var txtDteTo = document.forms["frmppmove"]["txtTodate"].value;
    if (txtDteFrom == null || txtDteFrom == "") {
        alert("From date must be filled by valid formate (yyyy-MM-dd).");
        document.getElementById("txtFromdate").focus();
    }
    else if (txtDteTo == null || txtDteTo == "") {
        alert("To date must be filled by valid formate (yyyy-MM-dd).");
        document.getElementById("txtTodate").focus();
    }
    else if (txtDteFrom > txtDteTo) {
        alert("To date must be greater than from date.");
        document.getElementById("txtTodate").focus();
    }
    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
    }
}
function LeaveValidation() {
    document.getElementById("hdnconfirm").value = "0";
    var txtStaff = document.forms["frmleave"]["txtStaff"].value;
    var txtDteFrom = document.forms["frmleave"]["txtFromdate"].value;
    var txtDteTo = document.forms["frmleave"]["txtTodate"].value;
    if (txtStaff == null || txtStaff == "") {
        alert("Sorry there is no selected person.");
        document.getElementById("txtStaff").focus();
    }
    else if (txtDteFrom == null || txtDteFrom == "") {
        alert("From date must be filled by valid formate (yyyy-MM-dd).");
        document.getElementById("txtFromdate").focus();
    }
    else if (txtDteTo == null || txtDteTo == "") {
        alert("To date must be filled by valid formate (yyyy-MM-dd).");
        document.getElementById("txtTodate").focus();
    }
    else if (txtDteFrom > txtDteTo) {
        alert("To date must be greater than from date.");
        document.getElementById("txtTodate").focus();
    }
    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }
    }
}

function ViewTodayNetSales(coustomer, point) {
    window.open('../Reports/ReportOnDailySales.aspx?ENROLL=' + coustomer + '&POINT=' + point, 'sub', "height=350, width=750, scrollbars=yes, left=300, top=250, resizable=no, title=Preview");
}
function ViewTransitdetails(remarks, autoid, pointid) {
    window.open('ReportOnTransitDetails.aspx?REMARKS=' + remarks + '&AUTOID=' + autoid + '&POINT=' + pointid, 'sub', "height=250, width=450, scrollbars=yes, left=300, top=250, resizable=no, title=Preview");
}
function ViewNationaldetails(id, type, frm, to) {
    window.open('../Reports/MNationalDetails.aspx?ID=' + id + '&TYPE=' + type + '&FRM=' + frm + '&TO=' + to, 'sub', "height=350, width=850, scrollbars=yes, left=205, top=250, resizable=no, title=Preview");
}
function ViewMemodetails(id) {
    window.open('CMemoDetails.aspx?ID=' + id , 'sub', "height=350, width=830, scrollbars=yes, left=205, top=250, resizable=no, title=Preview");
}
function ViewIndentDetails(id, particulers, dt) {
    document.getElementById('hdnDivision').style.visibility = 'visible';
}
function ViewChallanDetails(id, particulers, dt) {
    document.getElementById('hdnDivision').style.visibility = 'visible';
    Compute(); //CheckChange(); 
}
function CheckChange() {
    if ($('#chkVh').attr('checked')) {document.getElementById('hdnDivision').style.visibility = 'visible';}
    else {$("#hdnDivision").fadeOut("slow");}
}

function ViewPrintChallan(id) {
    window.open('../Sad/ChallanPrint.aspx?ID=' + id , 'sub', "height=450, width=650, scrollbars=yes, left=300, top=200, resizable=no, title=Preview");
}
function ViewCashHoldingDetails(id, particulers, type, dt) {
    document.getElementById('hdnDivision').style.visibility = 'visible';
}
function ViewStockDetails(id, particulers, type, dt) {
    document.getElementById('hdnDivision').style.visibility = 'visible';
}
function ConfirmIndentDate() {
    document.getElementById("hdnconfrmdt").value = "0";
    var dteInd = document.forms["frmmanualindnt"]["txtDate"].value;
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    if (day < 10) { day = "0" + day; }
    if (month < 10) { month = "0" + month; }
    now = year + "-" + month + "-" + day

    if ((now > dteInd)) {
        alert("Indent date must be greater or equel today date.");
        document.getElementById("txtDate").focus();
    }
    else { document.getElementById("hdnconfrmdt").value = "1"; DisplayLoadingDiv(); }
}
function ConfirmDate() {
    document.getElementById("hdnconfrmdt").value = "0";
    var dteInd = document.forms["frmindnt"]["dteInd"].value;
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    if (day < 10) { day = "0" + day; }
    if (month < 10) { month = "0" + month; }
    now = year + "-" + month + "-" + day

    if ((now > dteInd)) {
        alert("Indent date must be greater or equel today date.");
        document.getElementById("dteInd").focus();
    }
    else { document.getElementById("hdnconfrmdt").value = "1"; DisplayLoadingDiv(); }
}
function IndentDetails(indentid) {
    window.open('../Setup/IndentDetails.aspx?ID=' + indentid, 'sub', "height=350, width=475, scrollbars=yes, left=300, top=250, resizable=no, title=Preview");
}
function ViewMonitoringdetails(id, brand, type) {
    window.open('../Reports/MMonitoringDetails.aspx?ID=' + id + '&TYPE=' + type + '&BRAND=' + brand, 'sub', "height=650, width=1200, scrollbars=yes, left=50, top=30, resizable=no, title=Preview");
}
function ConfirmRegistration()
{
    document.getElementById("hdnconfirmregistration").value = "0";
    var fullname = document.forms["frmmanpowerregis"]["txtFullName"].value;
    var contactno = document.forms["frmmanpowerregis"]["txtContactNo"].value;
    var pointcode = document.forms["frmmanpowerregis"]["txtPointCode"].value;
    var peradd = document.forms["frmmanpowerregis"]["txtPermanentAddress"].value;    
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    if (day < 10) { day = "0" + day; }
    if (month < 10) { month = "0" + month; }
    now = year + "-" + month + "-" + day
    var joindate = document.forms["frmmanpowerregis"]["txtJoiningDate"].value;
    var accountno = document.forms["frmmanpowerregis"]["txtAccountNo"].value;
    var monsalary = document.forms["frmmanpowerregis"]["monSalary"].value;

    if (fullname == null || fullname == "") {
        alert("Full name must be filled.");
    }
    else if (contactno == null || contactno == "" || contactno.length > 11 || isNaN(contactno)) {
        alert("ContactNo must be filled by numeric value and max length is 11.");
    }
    else if (pointcode == null || pointcode == "") {
        alert("Code no must be filled.");
    }
    else if (peradd == null || peradd == "") {
        alert("Permanent address must be filled.");
    }
    else if (joindate == null || joindate == "") {
        alert("Joining date must be filled by valid formate (year-month-day).");
    }
    //else if (now > joindate) {
    //    alert("Joining date must be greater or equel today date.");
    //}
    else if (accountno == null || accountno == "" || accountno.length > 13 || accountno.length < 13 || isNaN(accountno)) {
        alert("Account number must be filled by 13 digit.");
    }
    else if (monsalary == null || monsalary == "" || isNaN(monsalary)) {
        alert("Total salary must be filled by numeric value.");
    }

    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirmregistration").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirmregistration").value = "0"; }
    }
}
function ConfirmCVoucher() {
    document.getElementById("hdnconfirmvoucher").value = "0";
    var vtp = document.forms["frmve"]["ddlVouchertype"].value;
    var scoa = document.forms["frmve"]["txtSCOA"].value;
    var adjtp = document.forms["frmve"]["ddlAdjustment"].value;
    var vQuantity = document.forms["frmve"]["txtQuantity"].value;
    var vAmount = document.forms["frmve"]["txtAmount"].value;
    var voucherDate = document.forms["frmve"]["txtVoucherDate"].value;
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    if (day < 10) { day = "0" + day; }
    if (month < 10) { month = "0" + month; }
    now = year + "-" + month + "-" + day;
    if (vtp == 0 || vtp == 1) {
        if (voucherDate == null || voucherDate == "" || voucherDate > now) {
            alert("Voucher date must be filled by valid formate (year-month-day).");
        }
        else if (vAmount == null || vAmount == "" || vAmount == "0.00" || !isDecimal(vAmount)) {
            alert("Voucher amount must be filled by numeric value.");
        }

        else {
            document.getElementById("hdnconfirmvoucher").value = "1";
            //var confirm_value = document.createElement("INPUT");
            //confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
            //if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirmvoucher").value = "1"; }
            //else { confirm_value.value = "No"; document.getElementById("hdnconfirmvoucher").value = "0"; }
        }
    }
    else if (vtp == 4 && adjtp == 'NA') {
        if (voucherDate == null || voucherDate == "" || voucherDate > now) {
            alert("Voucher date must be filled by valid formate (year-month-day).");
        }
        else if (vAmount == null || vAmount == "" || vAmount == "0.00" || !isDecimal(vAmount)) {
            alert("Voucher amount must be filled by numeric value.");
        }
        else if (scoa == null || scoa == "" || scoa.length <= 0) {
            alert("Please select another head.");
        }
        else { document.getElementById("hdnconfirmvoucher").value = "1"; }
    }

    else if (vtp == 4 && adjtp != 'NA') {
        if (voucherDate == null || voucherDate == "" || voucherDate > now) {
            alert("Voucher date must be filled by valid formate (year-month-day).");
        }
        else if (vAmount == null || vAmount == "" || vAmount == "0.00" || !isDecimal(vAmount)) {
            alert("Voucher amount must be filled by numeric value.");
        }
        else if (vQuantity == null || vQuantity == "" || vQuantity == "0" || !isDecimal(vAmount)) {
            alert("Voucher quantity must be filled by numeric value.");
        }
        else if (scoa == null || scoa == "" || scoa.length <= 0) {
            alert("Please select another head.");
        }
        else { document.getElementById("hdnconfirmvoucher").value = "1"; }
    }
}
function ConfirmOVoucher() {
    document.getElementById("hdnconfirmvoucher").value = "0";
    var vAmount = document.forms["frmve"]["txtBnkAmount"].value;
    var voucherDate = document.forms["frmve"]["txtBnkVoucherDate"].value;
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    if (day < 10) { day = "0" + day; }
    if (month < 10) { month = "0" + month; }
    now = year + "-" + month + "-" + day;

    if (voucherDate == null || voucherDate == "" || voucherDate > now) {
        alert("Voucher date must be filled by valid formate (year-month-day).");
    }
    else if (vAmount == null || vAmount == "" || !isDecimal(vAmount)) {
        alert("Voucher amount must be filled by numeric value.");
    }

    else {
        document.getElementById("hdnconfirmvoucher").value = "1";
        //var confirm_value = document.createElement("INPUT");
        //confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        //if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirmvoucher").value = "1"; }
        //else { confirm_value.value = "No"; document.getElementById("hdnconfirmvoucher").value = "0"; }
    }
}
function isDecimal(value) {
    return parseFloat(value) == value; // Check Intiger values by value % 1 === 0;
}
function ConfirmUpdate() {
    document.getElementById("hdnconfirmupdate").value = "0";
    var fullname = document.forms["frmprofileupdate"]["txtFullName"].value;
    var contactno = document.forms["frmprofileupdate"]["txtContactNo"].value;
    var pointcode = document.forms["frmprofileupdate"]["txtPointCode"].value;
    var peradd = document.forms["frmprofileupdate"]["txtPermanentAddress"].value;
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    if (day < 10) { day = "0" + day; }
    if (month < 10) { month = "0" + month; }
    now = year + "-" + month + "-" + day
    var joindate = document.forms["frmprofileupdate"]["txtJoiningDate"].value;
    var accountno = document.forms["frmprofileupdate"]["txtAccountNo"].value;
    var monsalary = document.forms["frmprofileupdate"]["monSalary"].value;

    if (fullname == null || fullname == "") {
        alert("Full name must be filled.");
    }
    else if (contactno == null || contactno == "" || contactno.length > 11 || isNaN(contactno)) {
        alert("ContactNo must be filled by numeric value and max length is 11.");
    }
    else if (pointcode == null || pointcode == "") {
        alert("Code no must be filled.");
    }
    else if (peradd == null || peradd == "") {
        alert("Permanent address must be filled.");
    }
    else if (joindate == null || joindate == "") {
        alert("Joining date must be filled by valid formate (year-month-day).");
    }
    //else if (now > joindate) {
    //    alert("Joining date must be greater or equel today date.");
    //}
    else if (accountno == null || accountno == "" || accountno.length > 13 || accountno.length < 13 || isNaN(accountno)) {
        alert("Account number must be filled by 13 digit.");
    }
    else if (monsalary == null || monsalary == "" || isNaN(monsalary)) {
        alert("Total salary must be filled by numeric value.");
    }

    else {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
        if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirmupdate").value = "1"; }
        else { confirm_value.value = "No"; document.getElementById("hdnconfirmupdate").value = "0"; }
    }
}
function ClosehdnDivision(sts) {
    if (sts == '1') { $("#hdnDivision").fadeOut("slow"); }
    else { alert(sts); $("#hdnDivision").fadeOut("slow"); }
    
}
