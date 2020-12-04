class ApplicationController < ActionController::Base
  protected
    def after_sign_in_path_for(resource)
      if customer_signed_in?
        customers_foods_path(resource)
      else
        admins_foods_path
      end
    end

  def after_sign_out_path_for(resource_or_sope)
    if resource_or_sope == :admin
      new_admin_session_path
    else
      root_path
    end
  end


private

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up,keys:[
     :name,
     :name_kana,
     :email,
     :postal_code,
     :address,
     :telephone_number,
     :is_deleted
     ])
 end
end
