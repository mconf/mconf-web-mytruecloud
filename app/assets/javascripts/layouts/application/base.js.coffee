# TODO: This file has utility functions of all kinds, might be
#       better to separate them in more files.

$(document).ready ->

  # Links to open the webconference
  # Open it in a new borderless window
  $("a.webconf-start-link:not(.disabled)").on "click", (e) ->
    window.open $(this)[0].href, "_blank", "resizable=yes"
    e.preventDefault()

  # Disable the click in any link with the 'disabled' class
  $("a.disabled").on "click", (e) ->
    false

  # Add a title and tooltip to elements that can only be used by a logged user
  $(".login-to-enable").each (idx) ->
    $(this).attr("title", "You need to be logged in") # TODO: get from i18n
    $(this).addClass("tooltipped")
    $(this).addClass("upwards")

  # Use jquery for placeholders in browsers that don't support it
  $('input[placeholder], textarea[placeholder]').placeholder()

  # auto focus the first element with the attribute 'autofocus' (in case the
  # browser doesn't do it)
  $('[autofocus]').first().focus()

  # links that automatically collapse or expand blocks inside a parent
  # div. Ex:
  # <div id="event_123">
  #   <div class"block-collapsed">
  #     i'm collapsed
  #     <a href="#event_123" class="link-to-expand">more</a>
  #   </div>
  #   <div class"block-expanded">
  #     i'm expanded
  #     <a href="#event_123" class="link-to-collapse">less</a>
  #   </div>
  # </div>
  $('.link-to-expand').on "click", (e) ->
    e.preventDefault()
    parent = $("#" + $(this).attr("href"))
    parent.find(".block-collapsed").hide()
    parent.find(".block-expanded").show()
  $('.link-to-collapse').on "click", (e) ->
    e.preventDefault()
    parent = $("#" + $(this).attr("href"))
    parent.find(".block-collapsed").show()
    parent.find(".block-expanded").hide()

  # Items with this class will only be visible when the item defined
  # by the id in the 'data-hover-tracked' attribute is hovered. Ex:
  # <div class="visible-on-hover" data-hover-tracked="event_123"></div>
  $('.visible-on-hover').each (idx) ->
    target = $(this)
    tracked = $("#" + $(this).attr("data-hover-tracked"))
    tracked.hover (e) ->
      target.show()
    , (e) ->
      target.hide()



# Changes the type of an input tag
# Example:
#   changeInputType("#moderator_password", 'password')
window.changeInputType = (id, type) ->
  marker = $("<span />").insertBefore(id)
  $(id).detach().attr("type", type).insertAfter marker
  marker.remove()



# TODO: check if the code below is being used / works

jQuery.fn.submitWithAjax = ->
  @submit ->
    $.post @action, $(this).serialize(), null, "script"
    false
  this

jQuery.fn.postsForm = (route) ->
  @ajaxForm
    dataType: "script"
    success: (data) ->
      window.location = route  if data is ""

jQuery.fn.ajaxLink = ->
  @click (data) ->
    $.get @href, {}, ((data) ->
      eval data
    ), "script"
    false
  this
