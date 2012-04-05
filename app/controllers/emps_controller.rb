class EmpsController < ApplicationController
  # GET /emps
  # GET /emps.json
  def index
   p params,"====================================================="
      # @emps=Emp.find_all_by_dept_id(params[:dept_id])
      @emps=Emp.find_all_by_dept_id(params[:dept_id])
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @emps }
    end
end

  # GET /emps/1
  # GET /emps/1.json
  def show
    
    # @dept=Dept.find(params[:dept_id])
    @emp = Emp.find(params[:id])
    p params,"=========******************==================="
      respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emp }
    end
  end

  # GET /emps/new
  # GET /emps/new.json
  def new
    #@dept_id = params[:id]
     @dept_id = params[:dept_id]
   p @dept_id,"=============_______________================"
    @emp = Emp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @emp }
    end
  end

  # GET /emps/1/edit
  def edit
   @emp =Emp.find(params[:id])
  end

  # POST /emps
  # POST /emps.json
  def create
     @emp = Emp.new(params[:emp])

    respond_to do |format|
      if @emp.save
        format.html { redirect_to dept_emps_path, :notice => 'Emp was successfully created.' }
        format.json { render :json => @emp, :status => :created, :location => @emp }
      else
        format.html { render :action => "new" }
        format.json { render :json => @emp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emps/1
  # PUT /emps/1.json
  def update
    
    @emp = Emp.find(params[:id])

    respond_to do |format|
      if @emp.update_attributes(params[:emp])
        format.html { redirect_to @emp, :notice => 'Emp was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @emp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emps/1
  # DELETE /emps/1.json
  def destroy
    
    @emp = Emp.find(params[:id])
    @emp.destroy

    respond_to do |format|
      format.html { redirect_to emps_url }
      format.json { head :ok }
    end
  end
 
end
