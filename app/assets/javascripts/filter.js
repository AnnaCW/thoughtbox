$(document).ready(function () {

  $("#link_filter_status").on("change", function () {
    var links = $('.links-listing');
    if (this.value === "Unread") {
      var currentStatus = "unread";
    }

    if (this.value === "Read") {
      var currentStatus = "read";
    }

    links.each(function (index, link) {
      var $link = $(link);
      var $linkClass = $(link).data("target");

      if($linkClass === currentStatus) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
