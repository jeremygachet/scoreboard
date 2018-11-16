class News < ApplicationRecord
    include ActiveModel::Dirty

    before_save   :update_published_date
    after_save    :expire_news_all_cache
    after_save    :send_mails
    after_destroy :expire_news_all_cache
  
    validates :link, format: URI::regexp(%w(http https)), :allow_blank => true

    def self.all_cached
        Rails.cache.fetch('News.all') { where(published: true).all.order(published_datetime: :asc).limit(200) }
    end

    def expire_news_all_cache
        Rails.cache.delete('News.all')
    end



    def update_published_date
        self[:published_datetime] = Time.new if published_changed? && published?
    end


    def send_mails
          PublishNews.call(type: 'news', news: self) if saved_change_to_published? && published?
    end


end
