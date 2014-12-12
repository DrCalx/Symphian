$("#search-box").bind "change keyup input", ->
  window.alert("yo")
  return



$("#search-box").bind "keyup", ->
  $("#search-box").addClass "loading"
  window.alert("yo")
  form = $("#search-form")
  url = "/users/index"
  formData = form.serialize()
  $.get url, formData, (html) ->
    $("#search-box").removeClass "loading"
    $("#search-results").html html
  return
return