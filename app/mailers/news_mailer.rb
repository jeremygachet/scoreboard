class NewsMailer < ApplicationMailer
    def news_email(teammate, news)
        @news = news
        mail(to: teammate.email, subject: 'News from the Krakathon')
    end
end
