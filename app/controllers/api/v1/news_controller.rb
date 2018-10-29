module Api::V1
  class NewsController < InheritedResources::Base

    def index
      render json: News.where(published: true).all.order(published_datetime: :desc).limit(200)
    end

    private

      def news_params
        params.require(:news).permit(:title, :content, :published, :published_datetime)
      end
  end
end
