$(function () {
    handleLoading();
});

function isNullOrEmpty(item) {
    if (item == null || item == undefined || item == "" || item == "undefined") {
        return true;
    } else {
        return false;
    }
}

function handleLoading() {


    $(document).ajaxStart(function () {
        $('.loading').show();
    });
    $(document).ajaxStop(function () {
        $('.loading').hide();
    });
}

function doAjax(url, data, successCallback) {
    $.ajax({
        type: "Get",
        data: data,
        url: url,
        success: function (data) {
            successCallback(data);
        },
        error: function (data) {
            showError("Some unexpected error ocuured");
        }

    });
}
function doAjaxPost(url, data, successCallback) {
    $.ajax({
        type: "POST",
        data: data,
        url: url,
        success: function (data) {
            successCallback(data);
        },
        error: function (data) {
            alert("error occured");
        }

    });
}

function showSuccess(msg) {
    var rndm = new Date().getTime();
    var id = rndm;
    var html = "<li class='mws-form-message success' style='display:none;' id='" + id + "'>" + msg + "</li>";
    $('ul.status').append(html);
    $('#' + id).fadeIn('slow');
    setTimeout(function () { $('#' + id).slideUp(1000, function () { $('#' + id).remove(); }); }, 5000);

}
function showError(msg) {
    var rndm = new Date().getTime();
    var id = rndm;
    var html = "<li class='mws-form-message error' style='display:none;' id='" + id + "'>" + msg + "</li>";
    $('ul.status').append(html);
    $('#' + id).fadeIn('slow');
    setTimeout(function () { $('#' + id).slideUp(1000, function () { $('#' + id).remove(); }); }, 5000);
}

function applyDatatable(arr) {

    demos.dtTableTools($('table.table'), arr);
    //$('table.table').dataTable();

}

function addDatepicker() {

    //$(".datepicker").datepicker({
    //    numberOfMonths: 1,
    //    onSelect: function (selected) {
    //    }
    //});
    $('.datepicker').datepicker({ changeMonth: true, changeYear: true, yearRange: '1920:c' });
}
function addDatepickerNext() {

    //$(".datepicker").datepicker({
    //    numberOfMonths: 1,
    //    onSelect: function (selected) {
    //    }
    //});
    $('.datepicker').datepicker({ changeMonth: true, changeYear: true, yearRange: 'c:2100' });
}


function addDatepickerForProject() {
    $('.datepicker').datepicker({ changeMonth: true, changeYear: true, yearRange: '2009:2100' });
}


function addDatepickerSimple() {

    //$(".datepicker").datepicker({
    //    numberOfMonths: 1,
    //    onSelect: function (selected) {
    //    }
    //});
    $('.datepicker').datepicker();
}
function changeDateFormat() {

    $(".datepicker").each(function () {
        var txt = $(this).val();

        try {

            if (txt != null && txt != "") {
                var d = new Date(txt);
                var newDate = (d.getMonth() + 1) + '/' + d.getDate() + '/' + d.getFullYear();
                $(this).val(newDate);
            }



        }
        catch (err) {
            $(this).val(txt);
        }
    });
}

function showSuccess(msg) {
    var rndm = new Date().getTime();
    var id = rndm;
    var html = '<div class="alert alert-success  width400  alignCenter" style="display:none;" id="' + id + '"><a href="#" class="close" data-dismiss="alert">×</a>' + msg + '</div>';

    $('ul.status').append(html);
    $('#' + id).fadeIn('slow');
    setTimeout(function () { $('#' + id).slideUp(1000, function () { $('#' + id).remove(); }); }, 5000);

}
function showError(msg) {
    var rndm = new Date().getTime();
    var id = rndm;
    var html = '<div class="alert alert-error  width400  alignCenter" style="display:none;" id="' + id + '"><a href="#" class="close" data-dismiss="alert">×</a>' + msg + '</div>';

    $('ul.status').append(html);
    $('#' + id).fadeIn('slow');
    setTimeout(function () { $('#' + id).slideUp(1000, function () { $('#' + id).remove(); }); }, 5000);
}

function openPrintPopup(btn, event) {
    event.preventDefault();
    var url = $(btn).attr('href');
    window.open(url, 'PingStatistics', 'status=0,toolbar=0,menubar=0,scrollbars=1,location=0,resizable=0,width=1200,height=800');


}

function makeNumeric() {
    $(".numeric").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            // $("#errmsg").html("Digits Only").show().fadeOut("slow");
            return false;
        }
    });
}

function applyDatatable() {
    $(".mws-datatable-fn").dataTable({
        "aLengthMenu": [
                [25, 50, 100, 200, -1],
                [25, 50, 100, 200, "All"]
        ],
        "iDisplayLength": -1
    });
}

function openPrintPopup(btn, event) {
    event.preventDefault();
    var url = $(btn).attr('href');
    window.open(url, 'PingStatistics', 'status=0,toolbar=0,menubar=0,scrollbars=1,location=0,resizable=0,width=1250,height=800');


}

function makeDecimal() {
    $(".decimal").keypress(function (e) {
        var charCode = (e.which) ? e.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    });
}

var demos = {

    dtTableTools: function (target, arr) {

        if ($.fn.dataTable) {

            target.dataTable({
                "sPaginationType": "full_numbers",
                "iDisplayLength": 10,
                "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                //"aaSorting": [[2, "desc"]],
                //"aoColumns": [
                //              null,
                //              null,
                //             null,
                //              null

                //              ],

                "sDom": "<'dt_header'<'row-fluid'<'span3'f><'span9'T>>r>t<'dt_footer'<'row-fluid'<'span4'i><'span4'l><'span4'p>>>",
                "oTableTools": {
                    "sSwfPath": "/plugins/datatables/TableTools/swf/copy_csv_xls_pdf.swf",
                    "aButtons": [
                        {
                            "sExtends": "copy",
                            "sButtonText": '<i class="icol-clipboard-text"></i> Copy',
                            "mColumns": arr
                        },
                        {
                            "sExtends": "csv",
                            "sButtonText": '<i class="icol-doc-excel-csv"></i> CSV',
                            "mColumns": arr
                        },
                        {
                            "sExtends": "xls",
                            "sButtonText": '<i class="icol-doc-excel-table"></i> Excel',
                            "sFileName": "*.xls",
                            "mColumns": arr
                        },
                        {
                            "sExtends": "pdf",
                            "sButtonText": '<i class="icol-doc-pdf"></i> PDF',
                            "mColumns": arr
                        },
                        {
                            "sExtends": "print",
                            "sButtonText": '<i class="icol-printer"></i> Print',
                            "mColumns": arr
                        }
                    ]
                }
            });
        }
    },
};
function goToByScroll(id) {
    // Reove "link" from the ID
    id = id.replace("link", "");
    // Scroll
    $('html,body').animate({
        scrollTop: $("#" + id).offset().top
    },
        'slow');
}


function getParameterByName(name,link) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(link);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}