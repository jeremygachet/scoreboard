class Team < ApplicationRecord
    validates :name, presence: true

    has_one_attached :logo


    after_save    :expire_cache
    after_destroy :expire_cache

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

