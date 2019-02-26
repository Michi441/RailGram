class RegistrationsController < Devise::RegistrationsController


    
    def after_update_path_for(resource)
        user_path(resource.id)
    end

end