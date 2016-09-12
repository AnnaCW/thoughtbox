$(document).ready(function () {

  $("#link_filter_status").on("change", function () {
    var links = $('.links-listing').children();
    if (this.value === "Unread") {
      var currentStatus = "false";
      console.log(currentStatus);
    }
    if (this.value === "Read") {
      var currentStatus = "true";
      console.log(currentStatus);
    }

    links.each(function (index, link) {
      var $link = $(link);
      var $linkClass = $(link).attr("class");
      console.log($link);

      if($linkClass === currentStatus) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
