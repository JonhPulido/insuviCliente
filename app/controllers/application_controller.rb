class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
 
  
    def configure_permitted_parameters
      
      devise_parameter_sanitizer.permit(:sign_up, keys: [:curp, :email])
     
    end



  
    #protected
     #def  authenticate_person!
      #     if person_signed_in?
       #       super
        #   else
          #   redirect_to root_path, :notice => 'Logeate para Continuar!'
          ## if you want render 404 page
          ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
         #  end
       # end



end
