class Validation < ApplicationRecord
    belongs_to :team
    belongs_to :exo
    belongs_to :created_by, foreign_key: :created_by, class_name: 'User', optional: true
    belongs_to :updated_by, foreign_key: :updated_by, class_name: 'User', optional: true


    validates :team, uniqueness: { scope: :exo, message: 'Cette équipe a déjà validé cet exercice' }


    before_create :add_creator
    after_save :update_team_total_score, :log_score 

    # save the whole current status of validations
    # in json
    def log_score
        #delay
        value = ActiveModel::Serializer::CollectionSerializer.new(Validation.includes(:team, :exo).all, serializer: ValidationSerializer) 
        ScoreLog.create({
            max_score: Exo.max_score,
            score: value
        })

    end

    # update team total score 
    def update_team_total_score
        team.total_score = team.count_total_score
        team.save
    end

    def add_creator
        unless  @current_user.nil?
            self[:created_by] =  @current_user.id
        end
    end
    
end
