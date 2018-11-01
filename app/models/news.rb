class News < ApplicationRecord
    validates :link, format: URI::regexp(%w(http https)), :allow_blank => true

    after_save    :expire_news_all_cache
    after_destroy :expire_news_all_cache
  

    def self.all_cached
        Rails.cache.fetch('News.all') { where(published: true).all.order(published_datetime: :asc).limit(200) }
    end

    def expire_news_all_cache
        Rails.cache.delete('News.all')
    end

end
