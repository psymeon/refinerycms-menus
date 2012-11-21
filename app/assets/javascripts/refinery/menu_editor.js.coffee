#= require ./helpers
#= require ./menu_link_views

class NewCustomLinkEditor

  constructor: ->
    @$container = $('#custom_url_box')
    @$container.find('a.add_link').click(@new_link)
    @$url_field = @$container.find('input[name=url]')
    @$label_field = @$container.find('input[name=label]')

  new_link: =>
    url = @$url_field.val()
    label = @$label_field.val()
    if url && label
      link_view = new CustomMenuLink(url, label)
      menuLinkIndex.append(link_view)
    return false


class MenuLinkIndex

  constructor: ->
    @$container = $('#links_container')

  append: (link_view) =>
    @$container.find('.placeholder-text').remove()
    @$container.append(link_view.el)


#class CustomMenuLink
#
#  constructor: (url, label, title_attribute) ->
#    @url = url
#    @label = label
#    @title_attribute = title_attribute || ""
#    console.log @title_attribute
#    @el = $(@render())
#    @el.find('.header').click =>
#      @el.find('.body').slideToggle()
#
#  type_name: =>
#    "Custom Link"
#
#  render: =>
#    "<div class='pp-link'>" +
#      "<div class='header'>" +
#        "<div class='name'>#{@label}</div>" +
#        "<div class='type'>#{@type_name()}</div>" +
#        "<span class='arrow'>&nbsp;</span>" +
#      "</div>" +
#      "<div class='body'>" +
#        ViewHelpers.input_tag('url', @url) +
#        ViewHelpers.input_tag('label', @label) +
#        ViewHelpers.input_tag('title_attribute', @title_attribute) +
#      "</div>" +
#    "</div>"


$('document').ready ->
  new NewCustomLinkEditor
  window.menuLinkIndex = new MenuLinkIndex



