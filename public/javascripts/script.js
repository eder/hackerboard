$(function(){
  var article = $("article")
    , articleHTML = article[0].outerHTML
    , avatarHTML = $(".users li")[0].outerHTML
  ;

  for (var i = 0; i < 4; i++) {
    $(article).after(articleHTML);
  }

  for (var i = 0; i < 19; i++) {
    $(".users").append(avatarHTML);
  }

  // USING MODERNIZR
  if (!Modernizr.inputtypes.search) {
    $("html").addClass("no-search-input");
  }

  // USING PURE JS
  var input = document.createElement("input");
  input.type = "search";

  if (input.type !== "search") {
    $("html").addClass("no-search-input");
  }
});
