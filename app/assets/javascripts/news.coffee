$(document).ready ->
#############################################
            # news
#############################################
  update_news = ->
    # $.get '/api/v1/news', (news) ->
    #   update_news_dom(news)
    $.ajax '/api/v1/news',
      type: 'GET'
      dataType: 'json'
      ifModified: true
      success: ( news, textStatus, jqXHR ) ->
        if 'notmodified' != textStatus
          update_news_dom(news)




  format_date = (date) ->
    date = new Date(date)
    date.toLocaleString('en-US', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })


  update_news_dom = (news) ->
    nw = $('#news-widget > .body')
    tpl = nw.find('.card:eq(0)')
    console.log 'renew updates'
    nw.empty()

    for key, article of news
      a = tpl.clone()
      a.find('.card-title .title').text(article.title)
      a.find('.card-text').html(article.content)
      a.find('time').text(format_date(article.published_datetime))
      if !!article.link
        a.find('.card-link').attr('href', article.link).text(article.link)
      else
        a.find('.card-link').remove()

      
      a.removeClass('hidden')
      nw.prepend(a)

  update_news()
  setInterval () ->
    update_news()
  , (1000 * 60 * 10)