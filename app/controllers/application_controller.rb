class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_admin
 

private
def current_admin
  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]

end
 end
 def authenticate_admin!
  p session[:admin_id],"************* admin id"
a = Admin.find(session[:admin_id])
p a,'******************** Admin table ***********'
  @current_admin = Admin.find(session[:admin_id]) 
 p @current_admin,"+++++++++++++++++++++============++++++++++++++++++++"
 
 end

#def require_admin
    #unless current_admin ?
      #store_location
      #flash[:error] = "Unauthorized access!"
      #redirect_to root_url
      #return false
    #end
  #end

 #def store_location
    #session[:return_to] =
    #if request.get?
      #request.request_uri
    #else
      #request.referrer
    #end
  #end

