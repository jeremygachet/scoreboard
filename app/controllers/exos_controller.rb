class ExosController < InheritedResources::Base

  private

    def exo_params
      params.require(:exo).permit(:name, :comment, :points, :position)
    end
end

