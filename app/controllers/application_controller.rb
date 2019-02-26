class ApplicationController < ActionController::Base
    include PublicActivity::StoreController


    before_action :config_params, if: :devise_controller? 


    def config_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:bio, :website])

    end


    def after_sign_in_path_for(resource)
        user_path(resource.id)
    end


end


