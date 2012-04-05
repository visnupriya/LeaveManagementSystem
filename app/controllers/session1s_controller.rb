class Session1sController < ApplicationController

def new

end

def create
  admin = Admin.authenticate(params[:token], params[:password])
  if admin
    session[:admin_id] = admin.id
   p session[:admin_id],"++++++++++"
    redirect_to new_form_path 
  else
    flash.now.alert = "Invalid token or password"
    render "new"
  end
end

def destroy
  session[:admin_id] = nil
  redirect_to new_session1_path, :notice => "Logged out!"
end

end
