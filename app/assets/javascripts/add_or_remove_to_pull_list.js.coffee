class AddOrRemoveToPullList

  constructor: (pullGrid, releaseGrid, current_user_id) ->
    @listLinks = $(pullGrid).find("a.js-card-link")
    @releaseLinks = $(releaseGrid).find("a.js-card-link")
    @currentUserId = current_user_id
    @assignLinks()

  assignLinks: =>
    if @currentUserId != false
      @userLinks()
    else
      @signInLinks()

  userLinks: ->
    for link in @listLinks
      link = $(link)
      link.html("Remove from List")
      link.on "click", {id: link.data("id")}, @removeFromList

    for link in @releaseLinks
      link = $(link)
      link.html("Pull It")
      link.on "click", {id: link.data("id")}, @addToList

  signInLinks: ->
    for link in @releaseLinks
      link = $(link)
      link.html("Pull It")
      link.attr("href", "/users/sign_in")

  removeFromList: (evt) =>
    evt.preventDefault()
    evt.stopPropagation()
    alert "Not Yet Implemented"

  addToList: (evt) =>
    evt.preventDefault()
    evt.stopPropagation()
    alert "Not Yet Implemented"

@WednesdayShelf ||= {}
@WednesdayShelf.AddOrRemoveToPullList = AddOrRemoveToPullList
