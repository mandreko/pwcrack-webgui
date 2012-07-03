$ ($) ->
  $("div.btn-group[data-toggle-name=*]").each ->
    group = $(this)
    form = group.parents("form").eq(0)
    name = group.attr("data-toggle-name")
    hidden = $("input[name=\"" + name + "\"]", form)
    $("button", group).each ->
      button = $(this)
      button.live "click", ->
        hidden.val $(this).val()

      button.addClass "active"  if button.val() is hidden.val()