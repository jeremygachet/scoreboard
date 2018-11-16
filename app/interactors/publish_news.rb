class PublishNews
  include Interactor

  #after publish news
  def call
    if context.type == 'news'
      news = context.news
      self.delay.delayed_send_news_email(news)
    elsif context.type == 'score'
      last_validation = Validation.includes(:team, :exo).last
      scoreboard = Team.order(total_score: :desc).pluck :name, :total_score
      self.delay.delayed_send_scores(last_validation, scoreboard )
    end
  end


  def delayed_send_news_email(news)
    Teammate.find_each do |t|
      NewsMailer.news_email(t, news).deliver
    end
  end

  def delayed_send_scores(last_validation, scoreboard)
    Teammate.find_each do |t|
      ScoreMailer.score_email(t, last_validation, scoreboard).deliver
    end
  end



end
