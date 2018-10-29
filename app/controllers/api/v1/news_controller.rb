class NewsController < InheritedResources::Base

  private

    def news_params
      params.require(:news).permit(:title, :content, :published, :published_datetime)
    end
end

