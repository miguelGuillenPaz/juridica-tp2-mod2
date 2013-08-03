jQuery(document).ready(function ($) {
    var url = window.location.href.toString();
    //var urlpath = window.location.pathname.toString();
    var value = url.substring(url.lastIndexOf('/') + 1);
    $('a[href="' + value + '"]').addClass('active');
    //    $('a[href="' + value + '"]').attr('href', 'javascript:;');

    // Menu Side Parent Active
    if ($(".sub-menu-interno").length > 0) {
        var Target_Parent = $(".sub-menu-interno").attr("parent_href");
        $('.navigation_menu a[href="' + Target_Parent + '"]').addClass('active');
    }
});