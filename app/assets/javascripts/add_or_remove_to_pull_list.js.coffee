class AddOrRemoveToPullList

  constructor: (pullGrid, releaseGrid, current_user_id) ->
    @pullGrid = $(pullGrid)
    @releaseGrid = $(releaseGrid)
    @currentUserId = current_user_id
    @regulateLists()
    @assignLinks()

  assignLinks: =>
    if @currentUserId != false
      @userLinks()
    else
      @signInLinks()

  userLinks: ->
    listLinks = @pullGrid.find("a.js-card-link")
    releaseLinks = @releaseGrid.find("a.js-card-link")
    for link in listLinks
      @formatLink(link, "Remove from Pulls", @removeFromList)

    for link in releaseLinks
      @formatLink(link, "Pull It", @addToList)

  signInLinks: ->
    releaseLinks = @releaseGrid.find("a.js-card-link")
    for link in releaseLinks
      link = $(link)
      link.html("Pull It")
      link.attr("href", "/users/sign_in")

  regulateLists: =>
    if @pullGrid.find('li').length == 0
      @pullGrid.find('li').hide()
      @pullGrid.find('h2.list-header').text("No Pulls this Week. Try something new!")
    else
      @pullGrid.find('li').show()
      @pullGrid.find('h2.list-header').text("Your Pulls")

    if @releaseGrid.find('li').length == 0
      @releaseGrid.find('li').hide()
      @releaseGrid.find('h2.list-header').text('No other books this week. You\'ve got some reading to do!')
    else
      @releaseGrid.find('li').show()
      @releaseGrid.find('h2.list-header').text('Also Arriving This Week')


  formatLink: (link, text, f) ->
    link = $(link)
    diamondCode = link.closest('li').attr("id")
    pullId = link.closest('li').attr("data-pull-id")
    link.html(text)
    link.off "click"
    link.on "click", {id: link.data("id"), pullId: pullId, diamondCode: diamondCode}, f

  moveCard: (card, destination, link) =>
      destination.append(card)
      @formatLink(link, "Pull It", link)
      destination.find('li.comic').tsort()
      card.show()
      @regulateLists()

  removeFromList: (evt) =>
    evt.preventDefault()
    evt.stopPropagation()
    card = $("#" + evt.data.diamondCode)
    link = card.find("a.js-card-link")
    pullId = evt.data.pullId
    url = "/users/#{@currentUserId}/pulls/#{pullId}"
    card.hide()
    $.ajax(url, {type: 'DELETE', issue_diamond_number : evt.data.diamondCode})
      .done =>
        @moveCard(card, @releaseGrid, @addToList)

  addToList: (evt) =>
    evt.preventDefault()
    evt.stopPropagation()
    card = $("#" + evt.data.diamondCode)
    link = card.find("a.js-card-link")
    url = "/users/#{@currentUserId}/pulls"
    params = {issue_diamond_number : evt.data.diamondCode}
    card.hide()
    $.post url, params, (data) =>
      @moveCard(card, @pullGrid, @removeFromList)

@WednesdayShelf ||= {}
@WednesdayShelf.AddOrRemoveToPullList = AddOrRemoveToPullList
