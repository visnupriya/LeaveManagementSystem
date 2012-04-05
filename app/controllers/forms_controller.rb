class FormsController < ApplicationController

  #before_filter :require_admin 
  before_filter :authenticate_admin! ,:only => [:new,:create]
  
 
  # GET /forms
  # GET /forms.json
  def index
     @s=current_user
 p @s,"++++++++++++++++++++************++++++++++++"
  @forms = Form.all
   respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @forms }
    end
 end


  # GET /forms/1
  # GET /forms/1.json
  def show
    @user=current_user.email
 p @user,"+++++???????????????????++++++++++++"
    @form = Form.find(params[:id])
  UserMailer.invitation(@form,@user).deliver
 p UserMailer.invitation(@form,@user).deliver ,"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"


    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
  #@admin=current_admin
 #p @admin,"===*=======================*====="
   #@emp_id= @admin.emp_id
 #p @a,"------------------------------------"
    #@b=Emp.find(@a)
 #p @b,"==========================="
   #@emp_name=@b.name
 #p @d,"++++++++++++++++++++++++"
   
    @form = Form.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @form }
    end
 end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])

    respond_to do |format|
      if @form.save
        format.html { redirect_to log_in_path, :notice => 'Thank you for applying leave...Leave approval will be received in your mail' }
        format.json { render :json => @form, :status => :created, :location => @form }
      else
        format.html { render :action => "new" }
        format.json { render :json => @form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, :notice => 'Form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])
  p @form,"??????????????"
     @form.destroy
 p @a, "************"

    respond_to do |format|
      format.html { redirect_to forms_path }
      format.json { head :ok }
    end
  end
end
