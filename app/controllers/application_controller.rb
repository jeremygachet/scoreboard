class ApplicationController < ActionController::Base
    #enable updated by on model
    before_action :set_userstamp

    def set_userstamp
      User.current_user = current_user unless current_user.nil?
    end
 
end
