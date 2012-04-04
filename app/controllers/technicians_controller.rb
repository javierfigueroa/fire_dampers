class TechniciansController < ApplicationController
  # GET /technicians
  # GET /technicians.json
  def index
    @technicians = Technician.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @technicians }
    end
  end

  # GET /technicians/1
  # GET /technicians/1.json
  def show
    @technician = Technician.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @technician }
    end
  end

  # GET /technicians/new
  # GET /technicians/new.json
  def new
    @technician = Technician.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @technician }
    end
  end

  # GET /technicians/1/edit
  def edit
    @technician = Technician.find(params[:id])
  end

  # POST /technicians
  # POST /technicians.json
  def create
    @technician = Technician.new(params[:technician])
    
    if @technician.email == nil || @technician.license == nil
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => "Invalid email or license", :status => :unprocessable_entity }
      end
    else
      user = User.new
      user.first_name = @technician.first_name
      user.last_name = @technician.last_name
      user.email = @technician.email
      user.password = @technician.license
      user.phone = @technician.phone

      respond_to do |format|
        if @technician.save && user.save
          format.html { redirect_to @technician, :notice => 'Technician was successfully created.' }
          format.json { render :json => @technician, :status => :created, :location => @technician }
        else
          format.html { render :action => "new" }
          format.json { render :json => @technician.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /technicians/1
  # PUT /technicians/1.json
  def update
    @technician = Technician.find(params[:id])

    respond_to do |format|
      if @technician.update_attributes(params[:technician])
        format.html { redirect_to @technician, :notice => 'Technician was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @technician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /technicians/1
  # DELETE /technicians/1.json
  def destroy
    @technician = Technician.find(params[:id])
    @technician.destroy

    respond_to do |format|
      format.html { redirect_to technicians_url }
      format.json { head :ok }
    end
  end
end
