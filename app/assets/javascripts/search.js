$(document).ready(function () {

  $('#search-box').on('keyup', function() {
    var searchTerm = $(this).val().toLowerCase();
    var links = $('.links-listing').children();

    links.each(function (index, link) {
      var $link = $(link);
      if($link.find(".title").text().toLowerCase().includes(searchTerm)) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
