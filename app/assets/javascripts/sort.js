$(document).ready(function(){
  $('#sorted-listing').on('click', function() {
    console.log("clicked");

    $.ajax({
        url: "/api/v1/links.json",
        method: "GET",
        dataType: "JSON",

        success: function(links){
          console.log("success");
          $(".links-listing").hide();
          $(links).each(function(index, link){
            $(".sorted-listing").append(
              "<h4 class='unread'>Mark As Read<input type='checkbox' class='status-box' value='false'/></h4>" +
              "<h4 class='read' style='display:none;'>Mark As Unread<input type='checkbox' class='status-box' value='true'/></h4>" +  
              "<li class='title'>" + link.title + "</li>" +
              "<li>" + link.url + "</li>" +
              "<li>Edit</li>"
            );
          });
        }
    });
  });
});
