module Api::V1
  class TeamsController < InheritedResources::Base

    def index
      render json: Team.all.order(name: :asc)
    end

    private
      def news_params
        params.require(:teams).permit(:name)
      end
  end
end
