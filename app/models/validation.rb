class Validation < ApplicationRecord
    belongs_to :team
    belongs_to :exo

    validates :team, uniqueness: { scope: :exo, message: 'Cette équipe a déjà validé cet exercice' }


    after_save :log_score, :update_team_total_score

    # save the whole current status of validations
    # in json
    def log_score
        #delay
        value = ActiveModel::Serializer::CollectionSerializer.new(Validation.includes(:team, :exo).all, serializer: ValidationSerializer) 
        ScoreLog.create({
            score: value
        })

    end

    def update_team_total_score
        team.total_score = team.count_total_score
        team.save
    end
    
end