$(document).ready ->
  $("#search-box").keyup ->
    $("#search-box").addClass "loading"
    form = $("#search-form")
    url = "/search"
    formData = form.serialize()
    $.get url, formData, (html) ->
      $("#search-box").removeClass "loading"
      $("#search-results").html html
  