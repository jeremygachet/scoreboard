scores = null
score  = null
boats  = {}
exos = {}
max_score = 0
agOptions = null

$(document).ready ->



  update_score_board = (score) ->
    max_score = score.max_score
    boats = filter_teams(score.score)
    console.log boats
    place_boats(boats)
    update_details(score.score)


  place_boats = (boats) ->
    for id, boat of boats
      $('#boat-' + boat.id).css( { left: boat_position(boat.total_score) + '%' } )


  boat_position = (score) ->
    Math.ceil((score * 100) / max_score)


  filter_teams = (validation) ->
    teams = {}
    for key, value of validation
      teams[value.team.id] = value.team
    teams

  init_boats = (teams) ->
    for key, t of teams
      boats[t.id] =
        id: t.id
        image: null
        team: t.name
        score: if t.total_score? then t.total_score else 0
      
      b = $('div#boat-' + t.id)
      if b.length == 0
        b = init_boat_dom(t)
    boats


  init_boat_dom = (boat) ->
    b = $('#boat-template').clone()
    b.attr('id', 'boat-' + boat.id )
       .attr('team-name', boat.name)
       .attr('team-id', boat.id)
       .find('.boat-name')
       .text(boat.name)
    b.removeClass('hidden')
    $('#sea').append(b)
    b



  update_scores = ->
    $.get '/api/v1/score', (data) ->
      score  = data
      update_score_board(score)

    
  init_teams = ->
    $.get '/api/v1/teams', (teams) ->
     boats = init_boats(teams)
     update_scores()


  init_teams()
  update_news()

  # update datas, (1000 * 60 * 10) 10 minutes
  setInterval () ->
    update_scores()
    update_news()
  , (1000 * 60 * 10)



############################################ 
            # detail
############################################

  update_details = (validations) ->
    list_exos(validations)
    if !!agOptions
      refreshGrid(validations)
    else
      init_grid(validations)


  list_exos = (validations) ->
    for k, v of validations
      exos[v.exo.id] = v.exo
    exos


  #init ag grid headers
  headers_columns = ->
    columnDefs = [
      { headerName: "team", field: "teamName" }
    ]
    for k, v of exos
       columnDefs.push( { headerName: v.name, field: 'e-' + v.id } )
    
    columnDefs.push( { headerName: 'Total Score', field: 'score' } )

    columnDefs

  #format ag grid datas
  row_datas = (validations) ->
    rows_object = {}
    for k, v of validations

      #init if does not exist
      unless  !!rows_object[v.team.id]
        rows_object[v.team.id] = { teamName: v.team.name }
      #insert data
      rows_object[v.team.id]['e-' + v.exo.id] = v.exo.points
      rows_object[v.team.id]['score'] = v.team.total_score



    Object.values(rows_object)


  init_grid = (validations) ->
    agrid = document.querySelector('#grid-details')
    agOptions = {
      columnDefs: headers_columns(),
      rowData: row_datas(validations),
      enableSorting: true
      enableFilter: true
      enableColResize: true
    }

    new agGrid.Grid(agrid, agOptions)


  refreshGrid = (validations) ->
    params = {
      force: true
    }
    agOptions.api.setRowData(row_datas(validations))
    agOptions.api.refreshCells(params)




#############################################
            # news
#############################################
 update_news = ->
    $.get '/api/v1/news', (news) ->
      update_news_dom(news)


  update_news_dom = (news) ->
    nw = $('#news-widget > .body')
    tpl = nw.find('.card:eq(0)')

    nw.empty()

    for key, article of news
      a = tpl.clone()
      a.find('.card-title').text(article.title)
      a.find('.card-text').html(article.content)
      if !!article.link
        a.find('.card-link').attr('href', article.link).text(article.link)
      else
        a.find('.card-link').remove()

      
      a.removeClass('hidden')
      nw.prepend(a)




