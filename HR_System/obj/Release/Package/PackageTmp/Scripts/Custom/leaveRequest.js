/// <reference path="../../js/jquery.min.js" />
/// <reference path="commonFunctions.js" />
$(function () {
    addDatepicker();
    changeDateFormat();
    showHideDDL();
});

function addDatepicker() {
    $(".startdate").datepicker({
        onSelect: function () {
            var isValid = validateLeaveRequest();
            setValidationHiddenField(isValid);
            if (isValid) {
                validateServerSide();
            }
        }
    });
    $(".enddate").datepicker({
        onSelect: function () {
            var isValid = validateLeaveRequest();
            setValidationHiddenField(isValid);
            if (isValid) {
                validateServerSide();
            }
        }
    });
}


function ddlOnchange() {
    if (validateLeaveRequest()) {
        validateServerSide();
    }
}
function validateLeaveRequest() {
    var startDate = $(".startdate").val();
    var endDate = $(".enddate").val();
    if (isNullOrEmpty(startDate)) {
        _showError("Please select start date");
        return false;
    }
    if (isNullOrEmpty(endDate)) {
        _showError("Please select end date");
        return false;
    }

    if (checkDateDifference(startDate, endDate) == false) {
        return false;
    }

    startDate = startDate.trim();
    endDate = endDate.trim();
    if (startDate == endDate) {
        $('#divFullHalfDay').slideDown();
    } else {
        $('#divFullHalfDay').slideUp();
    }
    
    var LeaveTypeID = $('#LeaveTypeID').val();
    if (isNullOrEmpty(LeaveTypeID)) {
        _showError("Please select Leave Type first and then select date");
        return false;

    }
    return true;

}

function validateForm() {
    try {
        if ($('form').valid()) {
            if ($('#hfFormValid').val() == "true") {
                //return true;
                return false;
            } else {
                return false;
            }
        } else {
            return false;
        }
    } catch (err) {
        txt = "There was an error on this page.\n\n";
        txt += "Error description: " + err.message + "\n\n";
        //console.log(txt);
        return true;
    }
}

function checkDateDifference(startDate, endDate) {
    startDate = $.datepicker.parseDate('mm/dd/yy', startDate);
    endDate = $.datepicker.parseDate('mm/dd/yy', endDate);

    var difference = (endDate - startDate) / (86400000);

    if (difference < 0) {
        _showError("To Date should be greater than or equal to From Date");
        return false;
    }
    return true;

}

function setValidationHiddenField(valid) {
    if (valid) {
        //alert("Valid "+valid);
        $('#hfFormValid').val('true')
    } else {
        //alert("InValid"+valid);
        $('#hfFormValid').val('false')
    }

}
// checkForLeaves(Guid employeeID, DateTime FromDate, DateTime? ToDate,bool isAjax)
function validateServerSide() {
    var LeaveTypeID = $('#LeaveTypeID').val();
    var halfDay = false;
    if ($('select[name=divFullHalfDay]').val().toLowerCase() == "halfday") {
        halfDay = true;
    }

    var employeeID = $('#hfEmployeeID').val();
    var startDate = $(".startdate").val().trim();
    var endDate = $(".enddate").val().trim();
    if (startDate == endDate) {
        endDate = null;
    }
    var ApprovalMode = false;
    var requestID = null;
    if ($('#hfApprovalPage').length > 0) {
        requestID = $('input[name=requestID]').val();
        ApprovalMode = true;
    }
    doAjax('/Employee/checkForLeaves', { LeaveTypeID: LeaveTypeID, employeeID: employeeID, FromDate: startDate, ToDate: endDate, isAjax: true, ApprovalMode: ApprovalMode, requestID: requestID, halfDay: halfDay }, function (data) {
        //console.log(data);
        if (data.success) {
            if (data.singleday) {
                if (data.halfDay) {
                    _showSuccess("No. Of Leave Days : 1/2");
                } else {
                    _showSuccess("No. Of Leave Days : 1");
                }
            }
            else {
                var totalLeaves = parseInt(data.weekendCount.totalLeaves);
                var weekend = parseInt(data.weekendCount.weekend);
                var Holiday = parseInt(data.weekendCount.holiday);
                var actualLeaves = totalLeaves - (weekend + Holiday);
                var msg = "<ul>";
                msg += "<li> No. Of Days :" + totalLeaves + "</li>";
                msg += "<li> Weekends :" + weekend + "</li>";
                msg += "<li> Holiday :" + Holiday + "</li>";
                msg += "<li> No. Of Leave Days :" + actualLeaves + "</li>";
                msg += "</ul>";
                _showSuccess(msg);
            }

        } else {
            var msg = "<ul>";
            $.each(data.msg, function (i) {
                msg += "<li>" + data.msg[i] + "</li>";
            });
            msg += "</ul>";
            //clear message div
            // $('#messageDiv').html('');
            _showError(msg);
        }
    });
}

function _showSuccess(msg) {

    var html = '<div style="padding:10px;" class="alert-success  width400  alignCenter">' + msg + '</div>';
    $('#messageDiv').html(html);
}
function _showError(msg) {

    var html = '<div style="padding:10px;" class="alert-error  width400  alignCenter">' + msg + '</div>';
    $('#messageDiv').html(html);
}
function showHideDDL() {
    var startDate = $(".startdate").val();
    var endDate = $(".enddate").val();
    if (isNullOrEmpty(startDate) == false && isNullOrEmpty(endDate) == false) {
        var startDate = $(".startdate").val().trim();
        var endDate = $(".enddate").val().trim();
        if (startDate == endDate) {
            $('#divFullHalfDay').slideDown();
            showIfHalfday();
        } else {
            $('#divFullHalfDay').slideUp();
        }
        return false;
    }

}

function showIfHalfday() {
    if ($('#hfIshalfday').length > 0) {
        var hfIshalfday = $('#hfIshalfday').val().toLowerCase();
        if (hfIshalfday == "true") {
            $('select[name=divFullHalfDay]').val('HalfDay');
        }
    }
}