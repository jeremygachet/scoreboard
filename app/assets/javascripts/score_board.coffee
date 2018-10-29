scores = null
score  = null
boats  = {}
exos = {}
max_score = 0

$(document).ready ->



  update_score_board = (score) ->
    max_score = score.max_score
    #  boats = init_boats(score.score) if Object.keys(boats).length == 0
    place_boats(boats)
    console.log 'score.score', score.score
    update_details(score.score)




  boat_position = (score) ->
    Math.ceil((score*100) / max_score)


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

  place_boats = (boats) ->
    for id, boat of boats
      console.log boat.score
      $('#boat-' + boat.id).css(left: boat_position(boat.score)+'%')


  update_scores = ->
    $.get '/api/v1/scores_history', (data) ->
      scores = data
      score  = data[0]
      update_score_board(score)

    
  init_teams = ->
    $.get '/api/v1/teams', (teams) ->
     boats = init_boats(teams)
     update_scores()


  init_teams()
  update_news()

  # setTimeout  update_scores, (1000 * 60 * 10)
  setInterval () ->  
    update_scores()
    update_news()
  , (1000 * 60 * 10)


############################################ 
            # detail
############################################

  update_details = (validations) ->
    list_exos(validations)
    init_grid(validations)


  list_exos = (validations) ->
    for k, v of validations
      exos[v.exo.id] = v.exo
    exos


  #init ag grid headers
  headers_columns = ->
    columnDefs = [
      {headerName: "team", field: "teamName"}
    ]
    for k,v of exos
       columnDefs.push({headerName: v.name, field: 'e-'+v.id})
    
    columnDefs.push({headerName: 'Total Score', field: 'score'})

    columnDefs

  #format ag grid datas
  row_datas = (validations) ->
    rows_object = {}
    console.log 'validations', validations
    for k,v of validations
      console.log 'row exist ? ', !!rows_object[v.team.id]
      console.log 'v ', v

      #init if does not exist
      unless  !!rows_object[v.team.id]
        rows_object[v.team.id] = {teamName: v.team.name}
      #insert data
      rows_object[v.team.id]['e-'+v.exo.id] = v.exo.points 
      rows_object[v.team.id]['score'] = v.team.total_score



    Object.values(rows_object)


  init_grid = (validations) ->
    console.log row_datas(validations)
    agrid = document.querySelector('#grid-details')
    agOptions = {
      columnDefs: headers_columns(),
      rowData: row_datas(validations),
      enableSorting: true
      enableFilter: true
      enableColResize: true
      cacheQuickFilter: true
    }

    console.log 'options', agOptions
    new agGrid.Grid(agrid, agOptions)





#############################################
            # news
#############################################
 update_news = ->
    $.get '/api/v1/news', (news) ->
      update_news_dom(news)


  update_news_dom = (news) ->
    nw = $('#news-widget')
    tpl = nw.find('.card:eq(0)')
    console.log news
    console.log nw

    for key, article of news
      a = tpl.clone()
      a.find('.card-title').text(article.title)
      a.find('.card-text').html(article.content)
      console.log !!article.link
      if !!article.link
        a.find('.card-link').attr('href', article.link).text(article.link)
      else
        a.find('.card-link').remove()

      
      a.removeClass('hidden')
      nw.prepend(a)




