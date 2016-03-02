 /// <reference path="../jquery-1.7.1.min.js" />
/// <reference path="commonFunctions.js" />

var hr = {


    loadCity: function () {

        doAjax(settingController + "cityPartialView", null, function (data) {

            $('#main-content').html(data);

        });
    },

    loadofficeLocation: function () {
        doAjax(settingController + "OfficeLocationPartialView", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadEmployeePV: function () {
        doAjax(homeController + "EmployeePV", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadUserAccessPV: function () {
        doAjax(homeController + "UserAccessPV", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadCountry: function () {
        doAjax(settingController + "CountryPartialView", null, function (data) {

            $('#main-content').html(data);

        });
    },

    leaveType: function () {
        doAjax(settingController + "LeaveTypePartialView", null, function (data) {

            $('#main-content').html(data);

        });
    },

    JobType: function () {
        doAjax(settingController + "JobTypePartialView", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadProjectList: function () {
        doAjax(settingController + "ProjectPV", null, function (data) {

            $('#main-content').html(data);

        });
    },
    Holiday: function (countryID) {
        doAjax(settingController + "HolidayPartialView", { countryID: countryID }, function (data) {

            $('#main-content').html(data);

        });
    },
    HolidayByCountry: function (archivedType) {
        //alert(archivedType);
        doAjax(settingController + "HolidayPartialView", { country: archivedType }, function (data) {

            $('#main-content').html(data);

        });
    },
    Department: function () {
        doAjax(settingController + "DepartmentPartialView", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadAddEmployeePV: function () {
        doAjax(homeController + "AddEmployeePV", null, function (data) {
            $('#main-content').html(data);
        });
    },
    loadEditEmployeePV: function (empid) {

        // var empid = $('#empid').val();

        doAjax(homeController + "EditEmployeePV", { id: empid }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadEmployeeDetailPV: function (empid) {

        // var empid = $('#empid').val();

        doAjax(homeController + "EmployeeDetailPV", { id: empid }, function (data) {
            $('#main-content').html(data);
        });
    },
    addEmployee: function () {


        if ($('#formAddEmployeePV').valid()) {
            var data = $('#formAddEmployeePV').serialize();
            doAjaxPost(homeController + "AddEmployeePV", data, function (data) {
                $('#main-content').html(data);
            });
            return false;
        } else {
            return false;
        }
    },
    loadJobinfo: function () {
        var empid = $('#id').val();
        doAjax(homeController + "jobDetailPV", { id: empid }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadJobinfoTab: function (empid) {

        // var empid = $('#empid').val();
        doAjax(homeController + "jobDetailPV", { id: empid }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadEmpLeaveinfo: function () {
        var empid = $('#id').val();
        doAjax(homeController + "LeaveDetailPV", { id: empid }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadEmpLeaveinfoTab: function () {

        var id = $('#empid').val();
        if (isNullOrEmpty(id)) {
            id = $('#id').val();
        }
        doAjax(homeController + "LeaveDetailPV", { id: id }, function (data) {
            $('#main-content').html(data);
        });
    },
    UpdateEmployee: function () {

        if ($('#formEditEmployeePV').valid()) {
            var data = $('#formEditEmployeePV').serialize();
            doAjaxPost(homeController + "EditEmployeePV", data, function (data) {
                $('#main-content').html(data);
            });
            return false;
        } else {
            return false;
        }
    },
    AddJobInformation: function () {

        if ($('#formJobDetailPV').valid()) {

            var data = $('#formJobDetailPV').serialize();
            doAjaxPost(homeController + "jobDetailPV", data, function (data) {
                $('#main-content').html(data);
            });
            return false;
        } else {
            return false;
        }
    },
    AddLeave: function () {
        if ($('#formLeaveDetailPV').valid()) {
            var data = $('#formLeaveDetailPV').serialize();
            doAjaxPost(homeController + "LeaveDetailPV", data, function (data) {
                $('#main-content').html(data);

            });
            return false;
        } else {
            return false;
        }
    },
    loadAllLeaveReq: function () {

        var year = null;
        var status = 'all';
        if ($('#ddlstatus').length > 0 && !isNullOrEmpty($('#ddlstatus').val())) {
            status = $('#ddlstatus').val();
        }
        if ($('#ddlYear').length > 0 && !isNullOrEmpty($('#ddlYear').val())) {
            year = $('#ddlYear').val();
        }
        doAjax(EmployeeController + "leaveDataPV", { status: status, year: year }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadAllLeaveReq: function (year) {

        var year = year;
        var status = 'all';
        if ($('#ddlstatus').length > 0 && !isNullOrEmpty($('#ddlstatus').val())) {
            status = $('#ddlstatus').val();
        }
        if ($('#ddlYear').length > 0 && !isNullOrEmpty($('#ddlYear').val())) {
            year = $('#ddlYear').val();
        }
        $('#ddlYear').val(year);
        doAjax(EmployeeController + "leaveDataPV", { status: status, year: year }, function (data) {
            $('#main-content').html(data);
            //$(".mws-collapsible").removeClass('mws-collapsed');
            //collspan();
            goToByScroll("data-grid");
        });
    },

    loadPendingLeaves: function (qryStrYear) {
        
        if (qryStrYear!=null && qryStrYear > 0) {
            var status = 'all';
            $('#ddlYear').val(qryStrYear);
            doAjax(EmployeeController + "PendingLeavesPV", { status: status, year: qryStrYear }, function (data) {
                $('#main-content').html(data);
            });
        }
        else {
            var year = null;
            var status = 'all';
            if ($('#ddlstatus').length > 0 && !isNullOrEmpty($('#ddlstatus').val())) {
                status = $('#ddlstatus').val();
            }
            if ($('#ddlYear').length > 0 && !isNullOrEmpty($('#ddlYear').val())) {
                year = $('#ddlYear').val();
            }
            doAjax(EmployeeController + "PendingLeavesPV", { status: status, year: year }, function (data) {
                $('#main-content').html(data);
            });
        }
    },

   

    loadAllTimeSheet: function () {

        var year = null;
        var status = 'all';
        if ($('#ddlstatus').length > 0 && !isNullOrEmpty($('#ddlstatus').val())) {
            status = $('#ddlstatus').val();
        }
        if ($('#Year').length > 0 && !isNullOrEmpty($('#Year').val())) {
            year = $('#Year').val();
        }
        doAjax(EmployeeController + "timeSheetPV", { status: status, year: year }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadAllTimeSheetNow: function (year) {

        var year = year;
        var status = 'all';
        if ($('#ddlstatus').length > 0 && !isNullOrEmpty($('#ddlstatus').val())) {
            status = $('#ddlstatus').val();
        }
        if ($('#Year').length > 0 && !isNullOrEmpty($('#Year').val())) {
            year = $('#Year').val();
        }
        $("#Year").val(year);
        doAjax(EmployeeController + "timeSheetPV", { status: status, year: year }, function (data) {
            $('#main-content').html(data);
            //$(".mws-collapsible").removeClass('mws-collapsed');
            //collspan();
            goToByScroll("data-grid");
        });
    },
    HolidaysPV: function () {
        doAjax(settingController + "HolidaysPV", null, function (data) {

            $('#main-content').html(data);

        });
    },
    AddHolidays: function () {

        if ($('#formAddHolidayPV').valid()) {

            var data = $('#formAddHolidayPV').serialize();
            doAjaxPost(settingController + "AddHolidayPV", data, function (data) {
                if (data.success) {
                    showSuccess(data.msg);
                    $('#myModal').modal('hide');
                    window.location.href = "/Settings/Holidays";
                } else {
                    showError(data.msg);
                }
            });
            return false;
        } else {
            return false;
        }
    },

    loadAllLeaveReqForSupervisor: function (status, returnUrl) {
        var id = null;
        if ($('#hfEmployeeID').length > 0) {
            id = $('#hfEmployeeID').val();
        }
        doAjax(EmployeeController + "detailedLeaveForSupervisorPV", { id: id, status: status, returnUrl: returnUrl }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadAllHolidays: function () {
        doAjax(EmployeeController + "holidaysPV", null, function (data) {
            $('#main-content').html(data);
            $('.ibutton').iButton();
        });
    },

    ApproveReq: function () {

        if ($('#req_form').valid()) {
            var data = $('#req_form').serialize();
            doAjaxPost(leaveController + "approveDisapproveLeave1", data, function (data) {

            });
            return false;
        } else {
            return false;
        }
    },

    loadAllTimeSheets: function (year) {

        doAjax(EmployeeController + "timeSheetPV", { year: year }, function (data) {
            $('#main-content').html(data);

        });
    },
    saveTimeSheet: function (month, year, day, tiMID, p_ID, hrs) {
        var _delete = false;
        var hr = $(hrs).val();
        if (hr == "" || hr == null) {
            _delete = true;
            //return false;
        }
        doAjax(EmployeeController + "UpdateTimeSheet", { month: month, year: year, day: day, proj_ID: p_ID, timeMID: tiMID, hrs: hr, _delete: _delete }, function (data) {

            if (data.success) {
                showSuccess(data.msg);
            }
            else {
                showError(data.msg);
            }

        });


    },

    saveTimeSheetHalf: function (month, year, day, tiMID, p_ID, hrs) {
        var h = $(hrs).val();
       
        if (parseInt(h).toString() != "NaN") {
            if (parseInt(h) <= 4) {
                hr.saveTimeSheet(month, year, day, tiMID, p_ID, hrs);
            }
            else {
                alert("half day leave can not exceed 4 hrs.");
                $(hrs).val("")
            }
        }
        else {
            hr.saveTimeSheet(month, year, day, tiMID, p_ID, hrs);
        }
    },
    updateTimeSheet: function (month, year, day, tiMID, p_ID, hrs, time_ID) {

        var hr = $(hrs).val();
        if (hr == "" || hr == null) {
            return false;
        }
        else {

            doAjax(EmployeeController + "UpdateTimeSheet", { month: month, year: year, day: day, proj_ID: p_ID, timeMID: tiMID, hrs: hr, timeSheet_ID: time_ID }, function (data) {

                if (data == true) {
                    window.location.reload();
                }
                else {

                    window.location.reload();
                }

            });
        }

    },

    submitTimesheet: function () {
        //$("input").removeClass('error');
        var month = $("#hdnmonth").val();
        var year = $("#hdnyear").val();
        var days = $("#hdn").val();
        //var errorCount = 0;
        //for (var i = 1; i <= days; i++) {
        //    var check = false;
        //    var totalTime = 0;
        //    $(".txt-" + i + "").each(function () {

        //        var hours = $(this).val();
        //        if (!isNaN(hours)) {

        //            totalTime += parseInt(hours);
        //            // errorCount = parseInt(errorCount) + 1;
        //        }
        //    });
        //    if (isNaN(totalTime)) {
        //        totalTime = 0;
        //    }
        //    if (totalTime < 8) {
        //        $(".txt-" + i + "").addClass('error');
        //    }
        //}
        //var errorCount = $('input.error').length;
        //if (errorCount <= 0) {
        if (confirm('Are you sure you want to submit this timesheet ?')) {
            doAjax(EmployeeController + "IsSubmitTimeSheet", { month: month, year: year }, function (data) {
                if (data.success) {
                    window.location.href = data.msg;
                } else {
                    showError(data.msg);
                }
            });
            return false;
        } else {
            return false;
        }
        //}
        //else {
        //    showError("Please fill complete sheet");
        //    return false;
        //}
    },
    loadEmpProjectinfoTab: function () {

        var empid = $('#empid').val();
        doAjax(homeController + "ProjectDetailPV", { id: empid }, function (data) {
            $('#main-content').html(data);
        });
    },

    AddProject: function () {

        var i = 0;
        $('.tr-row').each(function (i) {
            if ($(this).find('input[type=checkbox]').is(':checked')) {
                var jobtype = $(this).find('select.jobtype').val();
                var status = $(this).find('select.working').val();
                var fromDate = $(this).find('.fromdate').val();
                var toDate = $(this).find('.todate').val();
                if (isNullOrEmpty(jobtype)) {
                    i += 1;
                    $(this).find('select.jobtype').addClass('error');
                } else {
                    $(this).find('select.jobtype').removeClass('error');
                }

                if (isNullOrEmpty(status)) {
                    i += 1;
                    $(this).find('select.working').addClass('error');
                } else {
                    $(this).find('select.working').removeClass('error');
                }

                if (isNullOrEmpty(fromDate)) {
                    i += 1;
                    $(this).find('.fromdate').addClass('error');
                }
                else {
                    $(this).find('.fromdate').removeClass('error');
                }
                if (isNullOrEmpty(toDate)) {
                    i += 1;
                    $(this).find('.todate').addClass('error');
                }
                else {
                    $(this).find('.todate').removeClass('error');
                }

            }
        });
        var errorCount = $('.error').length;
        if (errorCount == 0) {

            if ($('#formProjectDetailPV').valid()) {
                var data = $('#formProjectDetailPV').serialize();
                doAjaxPost(homeController + "ProjectDetailPV", data, function (data) {
                    if (data.success) {
                        window.location.href = "/Home/Employee";
                    } else {
                        showError(data.msg);
                    }
                });
                return false;
            } else {
                return false;
            }
        } else {
            return false;
        }
    },

    loadAllTimeSheetForSupervisor: function (year, returnUrl) {
        var id = null;
        if ($('#hfEmployeeID').length > 0) {
            id = $('#hfEmployeeID').val();
        }
        doAjax(EmployeeController + "EmployeetimeSheetPV", { year: year, id: id, returnUrl: returnUrl }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadPendingTimesheetswithddl: function () {
        var id = null;
        var year = $("#Year").val();
        if ($('#hfEmployeeID').length > 0) {
            id = $('#hfEmployeeID').val();
        }
        doAjax(EmployeeController + "PendingTimesheetsPV", { year: year, id: id }, function (data) {
            $('#main-content').html(data);
        });
    },
    loadPendingTimesheetswithddl: function (year) {
        var id = null;
        var year = year;
        if ($('#Year').length > 0 && !isNullOrEmpty($('#Year').val())) {
            year = $('#Year').val();
        }
        if ($('#hfEmployeeID').length > 0) {
            id = $('#hfEmployeeID').val();
        }
        $('#Year').val(year);
        doAjax(EmployeeController + "PendingTimesheetsPV", { year: year, id: id }, function (data) {
            $('#main-content').html(data);
            //$(".mws-collapsible").removeClass('mws-collapsed');
            //collspan();
            goToByScroll("data-grid");
        });
    },
    loadPendingTimesheets: function (year) {
        var id = null;
        if ($('#hfEmployeeID').length > 0) {
            id = $('#hfEmployeeID').val();
        }
        doAjax(EmployeeController + "PendingTimesheetsPV", { year: year, id: id }, function (data) {
            $('#main-content').html(data);
            //$(".mws-collapsible").removeClass('mws-collapsed');
            //collspan();
            goToByScroll("data-grid");
        });
    },
    loadAllLeaves: function () {
        doAjax(EmployeeController + "VacationsBalancePV", null, function (data) {
            $('#main-content').html(data);

        });
    },

    loadTimesheetForProjects: function (returnUrl) {
        var id = null;
        if ($('#hfEmployeeID').length > 0) {
            id = $('#hfEmployeeID').val();
        }
        doAjax(EmployeeController + "timeSheetWithProjectsPV", { id: id, returnUrl: returnUrl }, function (data) {
            $('#main-content').html(data);

        });
    },
    loadTimesheetForProjectsForHR: function () {
        doAjax(EmployeeController + "timeSheetWithProjectsPVForHR", null, function (data) {
            $('#main-content').html(data);

        });
    },
    loadMyprojects: function () {
        doAjax(EmployeeController + "MyProjectsPV", null, function (data) {
            $('#main-content').html(data);

        });
    },

    loadManageStaff: function () {
        doAjax(EmployeeController + "ManageStaffPV", null, function (data) {
            $('#main-content').html(data);

        });
    },
    loadSupervisorEpmloyees: function (staffid, supervisorID) {
        doAjax(EmployeeController + "_SetWeekendWorkingDays", { staffid: staffid, supervisorID: supervisorID }, function (data) {
            $('#main-content').html(data);

        });
    },
    saveWeekendWorkingDays: function () {
        var data = $('#formSetWeekendWorkingDaysPV').serialize();
        doAjaxPost(EmployeeController + "_SetWeekendWorkingDays", data, function (data) {
            window.location.href = "/Employee/ManageStaff";

        });
    },
    loadUserAccessPV: function () {
        doAjax(homeController + "UserAccessPV", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadNotifications: function () {
        doAjax(Notification + "AllNotification", null, function (data) {

            $('#main-content').html(data);

        });
    },
    loadMyProjectsListPV: function (id, publicEmployee, returnUrl) {
        doAjax(EmployeeController + "MyProjectsListPV", { id: id, publicEmployee: publicEmployee, returnUrl: returnUrl }, function (data) {

            $('#main-content').html(data);

        });
    },
    loadEmployeeFiles: function () {
        doAjax(EmployeeController + "EmployeeFilesPV", null, function (data) {
            $('#main-content').html(data);

        });
    },
    loadHRFunctions: function () {
        doAjax(EmployeeController + "HRFunctionsPV", null, function (data) {
            $('#main-content').html(data);

        });
    },
    loadHRFunctionsTerminatePV: function (id, TerinateType) {

        doAjax(EmployeeController + "HRFunctionsTerminatePV", { id: id, TerinateType: TerinateType }, function (data) {
            //$('#main-content').html(data);
            $('#leaveDetail').html(data);
            $('#myModal').modal();
            $('#myModal').modal('show');
            //$('#myModal').modal();
            //$('#myModal').modal('show');

        });
    },

    loadHRFunctionsUnTerminate: function (id,uid) {
        obj = confirm("Are You Sure To Un-Terminate?");
        if (obj) {

            doAjax(EmployeeController + "HRFunctionUnterminate", { id: id, uid: uid }, function (data) {
                if (data.success) {
                    window.location.href = "/Employee/HRFunctions";
                }

            });
        }
    },
    showLeavesDetail: function (employeeID, leaveTypeId, isReport) {
        doAjax(EmployeeController + "LeaveDetails", { employeeID: employeeID, leaveTypeId: leaveTypeId, isReport: isReport }, function (data) {
            $('#leaveDetail').html(data);
            $('#myModal').modal();
            $('#myModal').modal('show');

        });
    },
    recallTimesheet: function (timesheetMasterID) {
        if (confirm('Are you sure you want to recall this timesheet ?')) {
            doAjax(EmployeeController + "RecallTimesheet", { timesheetMasterID: timesheetMasterID }, function (data) {
                if (data.success) {
                    window.location.reload();
                } else {
                    showError(data.msg);
                }
            });
            return false;
        } else {
            return false;
        }
    },
    checkAvailability: function () {
        $('#message').html('');
        $('#message').removeClass('success');
        $('#message').removeClass('failure');
        var username = $('#UserName').val();
        if (!isNullOrEmpty(username)) {
            doAjax(homeController + "checkAvailablity", { username: username }, function (data) {
                if (data.success) {
                    $('#message').addClass('success');
                } else {
                    $('#message').addClass('failure');
                }
                $('#message').html(data.msg);
            });
        } else {
            $('#message').addClass('failure');
            $('#message').html("Username is required");
        }
    },
    timesheetReport: function (month, year) {
        doAjax(ReportController + "TimesheetReportPV", { month: month, year: year }, function (data) {
            $('#main-content').html(data);

        });
    },
    timesheetReportNew: function (month, year, OfficeLocation, Department, Status) {
        doAjax(ReportController + "TimesheetReportPV", { month: month, year: year, OfficeLocation: OfficeLocation, Department: Department, Status: Status }, function (data) {
            $('#main-content').html(data);

        });
    },
    unlockUser: function () {
        var employeeID = $('#EmployeeList').val();
        if (!isNullOrEmpty(employeeID)) {
            $.getJSON(homeController + "UnlockUserJson", { employeeID: employeeID }, function (data) {
                if (data.success) {
                    showSuccess(data.message);
                } else {
                    showError(data.message);
                }
            });
        } else {
            showError("Please select a user from Dropdown first");
        }
    },
      
    AddMyProject: function () {

        var i = 0;
        $('.tr-row').each(function (i) {
            if ($(this).find('input[type=checkbox]').is(':checked')) {
                var jobtype = $(this).find('select.jobtype').val();
                var status = $(this).find('select.working').val();
                var fromDate = $(this).find('.fromdate').val();
                var toDate = $(this).find('.todate').val();
                if (isNullOrEmpty(jobtype)) {
                    i += 1;
                    $(this).find('select.jobtype').addClass('error');
                } else {
                    $(this).find('select.jobtype').removeClass('error');
                }

                if (isNullOrEmpty(status)) {
                    i += 1;
                    $(this).find('select.working').addClass('error');
                } else {
                    $(this).find('select.working').removeClass('error');
                }

                if (isNullOrEmpty(fromDate)) {
                    i += 1;
                    $(this).find('.fromdate').addClass('error');
                }
                else {
                    $(this).find('.fromdate').removeClass('error');
                }
                if (isNullOrEmpty(toDate)) {
                    i += 1;
                    $(this).find('.todate').addClass('error');
                }
                else {
                    $(this).find('.todate').removeClass('error');
                }

            }
        });
        var errorCount = $('.error').length;
        if (errorCount == 0) {

            if ($('#formProjectDetailPV').valid()) {
                var data = $('#formProjectDetailPV').serialize();
                doAjaxPost(EmployeeController + "AddProject", data, function (data) {
                    if (data.success) {
                        window.location.href = "/Employee/MyProjectsList";
                    } else {
                        showError(data.msg);
                    }
                });
                return false;
            } else {
                return false;
            }
        } else {
            return false;
        }
    },
    terminationBalance: function (date, id) {
        doAjax(EmployeeController + "getTermationBalance", { date: date, id: id }, function (data) {
            $('#LeaveBalacneAtTermination').val(data);
        });
    }
}