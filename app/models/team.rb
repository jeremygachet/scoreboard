class Team < ApplicationRecord
    validates :name, presence: true

    def count_total_score
        Validation.joins(:exo).where(team_id: self[:id]).sum(:points)
    end
end
