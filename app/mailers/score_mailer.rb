class ScoreMailer < ApplicationMailer
    def score_email(teammate, last_validation, scoreboard)
        @last_validation = last_validation
        @scoreboard = scoreboard
        mail(to: teammate.email, subject: 'New published score from the Krakathon')
    end


end
