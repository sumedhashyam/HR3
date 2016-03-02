jQuery.extend(jQuery.fn.dataTableExt.oSort, {
    "date-uk-pre": function (a) {
        var ukDatea = a.split('-');
        //console.log(ukDatea);
        return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
    },

    "date-uk-asc": function (a, b) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },

    "date-uk-desc": function (a, b) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    },
});

jQuery.extend(jQuery.fn.dataTableExt.oSort, {
    "date-uk-month-pre": function (a) {
        var ukDatea = a.split('-');
        //console.log(ukDatea);
        return (ukDatea[2] + getNumber(ukDatea[1]) + ukDatea[0]) * 1;
    },

    "date-uk-month-asc": function (a, b) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },

    "date-uk-month-desc": function (a, b) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    },
});

function getNumber(month)
{
    //console.log("aa");
    var month_names_short = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var index = month_names_short.indexOf(month);

    return index +1;

}