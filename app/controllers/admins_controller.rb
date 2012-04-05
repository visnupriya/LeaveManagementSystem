class AdminsController < ApplicationController
  def new
  @empid=params[:emp_id]
  p @emp_id,"===================*************==================="
  @d=Emp.find(@empid)
  p @d,"======="
  @mailid=@d.emailid
 p @mailid,"+++++++++++++++"
  @empname=@d.name
  p @empname,"*********************"
 
  
  @admin = Admin.new
 end

 def create
  @admin = Admin.new(params[:admin])
 p @admin, "==============="
  if @admin.save
    p @admin,"=====+++++++++++++++++++++=========="
   #redirect_to new_form_path, :notice => "Welcome!!!!!"
   #redirect_to admins_forms_new_path 
   redirect_to  new_session1_path
   #redirect_to admins/forms/new
    #redirect_to 'admins/#{admin.id}/forms/new'
  else
    render "new"
  end
 end
 def show
  @admin=Admin.find(params[:id])
 end
 

end
