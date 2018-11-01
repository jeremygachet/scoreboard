module Api::V1
  class TeamsController < InheritedResources::Base

    caches_action :index, expires_in: 10.minutes

    def index
      render json: Team.all_cached
    end

    private
      def news_params
        params.require(:teams).permit(:name)
      end
  end
end
