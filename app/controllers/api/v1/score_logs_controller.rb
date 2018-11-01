module Api::V1
  class ScoreLogsController < InheritedResources::Base

    caches_action :score, :scores_history,  expires_in: 5.minutes


    # return last published score log
    def scores_history
      render json: ScoreLog.where(published: true).order(id: :desc).limit(200)
    end

    # return last published score log
    def score
      render json: ScoreLog.where(published: true).last
    end

    private

      def score_log_params
        params.require(:score_log).permit(:name, :comment, :score, :published)
      end

  end
end