class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.json
 
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.json
  def new
     # @dept_id =Dept.find(params[:dept_id])
     #p @dept_id,"...........***********.............."
    @emp_id=params[:id]
    @emp_detail= Emp.find_by_id(@emp_id)
    @email = @emp_detail.emailid
     p @email, '------------------------------------------------'
    @invitation = Invitation.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.json
  def create

    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    p @invitation.sender ,"************************************"
    @user=current_user.email
    p @user,"++++++++++++++++++"
    respond_to do |format|
      if @invitation.save
        Mailer.deliver_invitation(@invitation,@user,signup_url(:invitation_token=>@invitation.token,:emp_id=>@invitation.emp_id)).deliver
      # p  Mailer.deliver_invitation(@invitation,@user,new_user_registration_url(:invitation_token=>@invitation.token)),"=============+++++++++++++=============" 
        format.html { redirect_to @invitation, :notice => 'Invitation was successfully sent to recipient.' }
        format.json { render :json => @invitation, :status => :created, :location => @invitation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to @invitation, :notice => 'Invitation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :ok }
    end
  end
end
