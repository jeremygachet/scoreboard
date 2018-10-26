class ValidationsController < InheritedResources::Base

  private

    def validation_params
      params.require(:validation).permit(:team, :exo)
    end
end

