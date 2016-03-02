/// <reference path="commonFunctions.js" />

var reports = {


    loadEmployees: function () {
        doAjax(ReportController + "EmployeeList", null, function (data) {
            $('#main-content').html(data);
        });
    },
    loadEmployeeProjects: function (id,year) {
        doAjax(ReportController + "ProjectList", { id: id,year:year }, function (data) {
            $('#main-content').html(data);            
        });
    },
    loadTimesheetList: function (id,year) {
        doAjax(ReportController + "TimesheetList", { id: id,year:year }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadTimesheetSummary: function (EmployeeID, TimesheetMasterId, returnUrl) {

        doAjax(ReportController + "TimesheetSummaryPV", { EmployeeID: EmployeeID, TimesheetMasterId: TimesheetMasterId, returnUrl: returnUrl }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadLeaveBalance: function (id, isEmployeee, year,returnUrl) {
        doAjax(ReportController + "LeaveBalancePV", { id: id, isEmployeee: isEmployeee, year: year,returnUrl:returnUrl }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadVacationBalanceReport: function () {
        doAjax(ReportController + "VacationBalanceReportPV", null, function (data) {
            $('#main-content').html(data);
        });
    },
    loadHolidays: function (id,year) {
        doAjax(ReportController + "HolidaysPV", { id: id, year:year }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadVacationRequests: function (id, year) {
        doAjax(ReportController + "VacationRequestPV", { id: id, year: year }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadCarryForward: function (id,returnUrl) {
        doAjax(ReportController + "CarryForwardPV", { id: id ,returnUrl:returnUrl}, function (data) {
            $('#main-content').html(data);
        });
    },
    loadCarryForwardForProccess: function (btn) {
        if (btn != null && btn != "") {
            //alert(btn);
            var liarr = btn.split(',');
            var d = "";
            var i = 0;
            if (liarr.length > 0) {
                for (i = 0; i < liarr.length; i++) {
                    var EmployeeID = liarr[i];
                    if (liarr[i] != null && liarr[i] != "") {
                        doAjax(ReportController + "CarryForwardPV", { id: liarr[i], returnUrl: "#" }, function (data) {
                           // d = d + data;
                            $('#main-content').html(data);
                            var willCarryForward = $("tbody tr.carryforward").length;
                            //alert(willCarryForward);
                            /* Start Save CarryForward*/
                            /* Save CarryForward*/
                            if (willCarryForward > 0) {
                                
                                var formdata = $('#carry-forward').serialize();
                                doAjaxPost('/Report/CarryForwardPV', formdata, function (data) {
                                    if (data.success) {
                                       
                                        if (i == (liarr.length)) {
                                            window.location.href = "/Employee/HRFunctions?success=1";
                                        }
                                    } else {
                                        showError(data.msg);
                                    }
                                });
                            }/* End*/

                        });
                    }

                    

                }
                
               
            }
            
        }
        
    },

    loadTimesheetSummaryOfPendingRequest: function (EmployeeID, TimesheetMasterId, isReport, returnUrl) {
        var encryptedUrl = null;
        if ($('#encryptedUrl').length > 0) {
            encryptedUrl = $('#encryptedUrl').val();
        }
        doAjax(EmployeeController + "TimesheetSummaryPV", { EmployeeID: EmployeeID, TimesheetMasterId: TimesheetMasterId, isReport: isReport, returnUrl: returnUrl, encryptedUrl: encryptedUrl }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadVacationReport: function () {
        doAjax(ReportController + "VacationReportPV", null, function (data) {
            $('#main-content').html(data);
        });
    },
    loadResetVacationReport: function () {
        doAjax(ReportController + "VacationReportPV", null, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllVactionRequestNew: function () {
        var id = $("#empid").html();
        var year = $("#ddlYear").val();
        $("#year").html(year);
        doAjax(ReportController + "VacationRequestPV", { id: id, year: year }, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllLeaveBalanceNew: function (isEmployeee) {
        var id = $("#empid").html();
        var year = $("#ddlYear").val();
     //   var isEmployeee = true;
        $("#year").html(year);
        doAjax(ReportController + "LeaveBalancePV", { id: id, isEmployeee: isEmployeee, year: year }, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllHolidaysNew: function () {
        var id = $("#empid").html();
        var year = $("#ddlYear").val();
        $("#year").html(year);
        doAjax(ReportController + "HolidaysPV", { id: id, year: year }, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllProjectListNew: function () {
        var id = $("#empid").html();
        var year = $("#ddlYear").val();
        $("#year").html(year);
        doAjax(ReportController + "ProjectList", { id: id, year: year }, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllTimesheetListNew: function () {
        var id = $("#empid").html();
        var year = $("#ddlYear").val();
        $("#year").html(year);
        doAjax(ReportController + "TimesheetList", { id: id, year: year }, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadEmpVacSmryRep: function () {

        //var year = null;
        //var status = 'all';
        //if ($('#ddlstatus').length > 0 && !isNullOrEmpty($('#ddlstatus').val())) {
        //    status = $('#ddlstatus').val();
        //}
        //if ($('#ddlYear').length > 0 && !isNullOrEmpty($('#ddlYear').val())) {
        //    year = $('#ddlYear').val();
        //}
        doAjax(ReportController + "VacationSummaryReportPV", {  }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadResetEmpVacSmryRep: function () {
        doAjax(ReportController + "VacationSummaryReportPV", null, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadTimeSheetLstDet: function () {
      
        doAjax(ReportController + "TimesheetListDetailPV", {}, function (data) {
            $('#main-content').html(data);
        });
    },
    loadTimeSheetLstDetNew: function () {

        doAjax(ReportController + "TimesheetListDetailPV", {}, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllVacationBalanceReportNew: function () {
        var year = $("#ddlYear").val();
        $("#year").html(year);
        doAjax(ReportController + "VacationBalanceReportPV", {  year: year }, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    },
    loadResetVacationBalanceReport: function () {        
        doAjax(ReportController + "VacationBalanceReportPV", null, function (data) {
            $('#main-content').html(data);
            $(".mws-collapsible").removeClass('mws-collapsed');
            collspan();
            goToByScroll("data-grid");
        });
    }

}