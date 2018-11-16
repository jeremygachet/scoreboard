class Team < ApplicationRecord

    has_one_attached :logo
    has_many :teammate, inverse_of: :team

    after_save    :expire_cache
    after_destroy :expire_cache

    validates :name, presence: true

    def count_total_score
        Validation.joins(:exo).where(team_id: self[:id]).sum(:points)
    end

    def self.all_cached
        Rails.cache.fetch('Team.all.asc') {all.includes(logo_attachment: :blob).order(name: :asc) }
    end

    def expire_cache
        Rails.cache.delete('Team.all.asc')
    end
end

