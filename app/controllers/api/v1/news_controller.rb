module Api::V1
  class NewsController < InheritedResources::Base

     caches_action :index, expires_in: 10.minutes

    def index
      Rails.cache.fetch([self.class.name, __method__]) do
        render json: News.where(published: true).all.order(published_datetime: :asc).limit(200)
      end
    end

    private
      def news_params
        params.require(:news).permit(:title, :content, :published, :published_datetime)
      end
  end
end
