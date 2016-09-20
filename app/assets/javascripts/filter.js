$(document).ready(function () {

  $("#link_filter_status").on("change", function () {
    var links = $('.links-listing');
    if (this.value === "Unread") {
      var currentStatus = "unread";
      console.log(currentStatus);
    }
    if (this.value === "Read") {
      var currentStatus = "read";
      console.log(currentStatus);
    }

    links.each(function (index, link) {
      var $link = $(link);
      var $linkClass = $(link).data("target");
      console.log($link);
      console.log($linkClass);

      if($linkClass === currentStatus) {
        console.log("match!");
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
