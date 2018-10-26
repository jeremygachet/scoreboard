class ScoreLogsController < InheritedResources::Base

  private

    def score_log_params
      params.require(:score_log).permit(:name, :comment, :score, :published)
    end
end

