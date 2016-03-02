/// <reference path="commonFunctions.js" />
/// <reference path="../jquery-1.7.1.js" />

function bindOnchnageOfNumber() {
    $(".numeric").bind('keyup mouseup', function () {
        var value = $(this).val();
        //alert(value);
        if (!isNullOrEmpty(value)) {
            setData();
        } else {
            setData();
        }
    });
}



function isInEditMode() {
    var isEdit = $('#hfEdit').val();
    if (isEdit == "true") {
        return true;
    } else {
        return false;
    }
}

function setData() {
    $('.carryforward').each(function (i) {
        var chboxBalanceLeaves = $(this).find('.chboxBalanceLeaves');
        var chboxPostponedLeaves = $(this).find('.chboxpostponedLeaves');
        var hfbalanceLeaves = $(this).find('.hfbalanceLeaves');
        var txtleaves = $(this).find('.txtleaves');
        var lbltotalLeaves = $(this).find('.lbltotalLeaves');
        var txttotalLeaves = $(this).find('.txttotalLeaves');
        var hdnpostpBalance = $(this).find('.postpBalance');

        var balanceLeaves = 0;
        var leaves = 0;
        var totalLeaves = 0;
        var postpBalance = 0;
        if ($(chboxBalanceLeaves).is(':checked')) {

            balanceLeaves += (parseFloat($(hfbalanceLeaves).val()));
        }
        if ($(chboxPostponedLeaves).is(':checked')) {

            balanceLeaves += (parseFloat($(hdnpostpBalance).val()));
        }
       
        leaves = parseFloat($(txtleaves).val());

        if (isNaN(leaves)) {
            leaves = 0;
        }

        totalLeaves = balanceLeaves + leaves;
        $(lbltotalLeaves).html(totalLeaves);
        $(txttotalLeaves).val(totalLeaves);

    });
}

function validateForm() {
    $('.numeric').removeClass('error');
    $('.numeric').each(function (i) {
        var val = $(this).val();
        if (isNullOrEmpty(val)) {
            $(this).addClass('error');
        }
    });
    if ($('.error').length > 0) {
        return false;
    } else {
        return true;
    }
}

function saveCarryForward() {

    if (validateForm()) {
        if (confirm('Are you sure you want to carry forward these leaves ?')) {
            //showSuccess("alright");
            //return false;

            var formdata = $('#carry-forward').serialize();
            doAjaxPost('/Report/CarryForwardPV', formdata, function (data) {
                if (data.success) {
                    var returnUrl = $('#returnurl').val();
                    window.location.href = returnUrl;
                } else {
                    showError(data.msg);
                }
            });
        }
    } else {
        showError("Please fill all leaves");
    }
    return false;
}

function setOrRemoveWeekendWorkigDays() {
    doAjax(EmployeeController + "_SetOrRemoveWorkingDays", null, function (data) {
        if (data.success) {
        }
    });
}