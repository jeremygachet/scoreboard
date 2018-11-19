class ScoreLog < ApplicationRecord
    after_save    :expire_cache
    after_save    :send_mails
    after_destroy :expire_cache

    def self.last_cached
      Rails.cache.fetch('Scorelog.last.published') { where(published: true).last }
    end

    def self.all_cached
        Rails.cache.fetch('Scorelog.all.published') { where(published: true).order(id: :desc).limit(200) }
    end


    ##
    ## send email to all teammates after a new publishing
    ##
    def send_mails
        PublishNews.call(type: 'score', score: self) if saved_change_to_published? && published?
    end


    def expire_cache
        Rails.cache.delete('Scorelog.last.published')
        Rails.cache.delete('Scorelog.all.published')
    end
end
