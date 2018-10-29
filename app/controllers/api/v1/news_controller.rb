module Api::V1
  class NewsController < InheritedResources::Base

    def index
      render json: News.all.order(published_datetime: :desc)
    end

    private

      def news_params
        params.require(:news).permit(:title, :content, :published, :published_datetime)
      end
  end
end
