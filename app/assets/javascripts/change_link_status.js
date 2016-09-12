$(document).ready(function(){

  $('.status-box').on('click', function() {
    // console.log(this);
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
          console.log(linkClass);
        },
        error: function(xhr) {
         console.log(xhr.responseText);
       }
      });
     });

  });
