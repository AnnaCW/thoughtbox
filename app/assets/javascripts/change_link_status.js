$(document).ready(function(){

  $('.status-box').on('click', function() {
      var link = $(this).parents("div");
      var linkClass = $(this).parents("div").attr("class");
      var linkId = $(this).parents("div").attr("id");
      var newLinkStatus = $(this).attr("value");
      var data = {link: { read: newLinkStatus} };

      $.ajax({
        url: "/api/v1/links/" + linkId + ".json",
        method: "PATCH",
        dataType: "JSON",
        data: data,
        success: function(updatedLink){
          $(".read").toggle("style");
          $(".unread").toggle("style");
          $('input:checkbox').removeAttr('checked');
        },
        error: function(xhr) {
         console.log(xhr.responseText);
       }
      });
     });

  });
