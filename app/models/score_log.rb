class ScoreLog < ApplicationRecord
    after_save    :expire_cache
    after_destroy :expire_cache

    def self.last_cached
      Rails.cache.fetch('Scorelog.last.published') { where(published: true).last }
    end

    def self.all_cached
        Rails.cache.fetch('Scorelog.all.published') { where(published: true).order(id: :desc).limit(200) }
    end


    def expire_cache
        Rails.cache.delete('Scorelog.last.published')
        Rails.cache.delete('Scorelog.all.published')
    end
end
