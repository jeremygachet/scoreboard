class TeamsController < InheritedResources::Base

  private

    def team_params
      params.require(:team).permit(:name, :company)
    end
end

