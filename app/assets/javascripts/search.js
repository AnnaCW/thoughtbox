$(document).ready(function () {

  $('#search-box').on('keyup', function() {
    var searchTerm = $(this).val().toLowerCase();
    var links = $('.links-listing');

    links.each(function (index, link) {
      var $link = $(link);
      if($link.find("li.title, li.url").text().toLowerCase().includes(searchTerm)) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
