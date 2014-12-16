class InspectionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update, :create, :destroy]
  
  # GET /inspections
  # GET /inspections.xml
  def index
    
    @inspections = Inspection.accessible_by(current_ability, :read)
     
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inspections }
      format.json { render :json => @inspections }
    end
  end

  def inspectionsByJob
    @inspections = Inspection.where(:job_id => params[:job_id])
     
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inspections }
      format.json { render :json => @inspections.to_json(:methods => [:damper_image_url_open, :damper_image_url_closed]) }
    end
  end

  # GET /inspections/1
  # GET /inspections/1.xml
  def show
    @inspection = Inspection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inspection }
      format.json  { render :json => @inspection }
    end
  end

  # GET /inspections/new
  # GET /inspections/new.xml
  def new
    @jobs = Job.where(:active => true) 
    @technicians = User.where(:role => 'technician')
    
    if @jobs.count == 0
      respond_to do |format|
        format.html { redirect_to(inspections_path, :notice => "No jobs available. You need jobs to add inspections.") }
        format.xml  { render :xml => @inspection, :status => :unprocessable_entity, :location => inspections_path }
        format.json  { render :json => @inspection, :status => :unprocessable_entity, :location => inspections_path }
      end
    elsif @technicians.count == 0
      respond_to do |format|
        format.html { redirect_to(inspections_path, :notice => "No technicians available. You need technicians to add inspections.") }
        format.xml  { render :xml => @inspection, :status => :unprocessable_entity, :location => inspections_path }
        format.json  { render :json => @inspection, :status => :unprocessable_entity, :location => inspections_path }
      end
    else
      @inspection = Inspection.new
      @damper_types = DamperType.all
      @damper_statuses = DamperStatus.all

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @inspection }
      end
    end
  end

  # GET /inspections/1/edit
  def edit
    @inspection = Inspection.find(params[:id])
  end

  # POST /inspections
  # POST /inspections.xml
  def create
    @inspection = Inspection.new(params[:inspection])
    @inspection.company_id = current_user.company_id;
    @inspection.tag = @inspection.floor.to_s << "-" << @inspection.damper_type.abbrev << "-" << @inspection.damper_airstream.abbrev << "-" << @inspection.unit.to_s << "-" << @inspection.damper_id.to_s
    
    respond_to do |format|
      if @inspection.save
        format.html { redirect_to(@inspection, :notice => 'Inspection was successfully created.') }
        format.xml  { render :xml => @inspection, :status => :created, :location => @inspection }
        format.json  { render :json => @inspection, :status => :created, :location => @inspection }
      else        
        format.html { render :action => "new" }
        format.xml  { render :xml => @inspection.errors, :status => :unprocessable_entity }
        format.json  { render :json => @inspection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inspections/1
  # PUT /inspections/1.xml
  def update
    @inspection = Inspection.find(params[:id])    
    respond_to do |format|
      if @inspection.update_attributes(params[:inspection])
        @inspection.tag = @inspection.floor.to_s << "-" << @inspection.damper_type.abbrev << "-" << @inspection.damper_airstream.abbrev << "-" << @inspection.unit.to_s << "-" << @inspection.damper_id.to_s
        @inspection.save
        
        format.html { redirect_to(@inspection, :notice => 'Inspection was successfully updated.') }
        format.xml  { head :ok }
        format.json  {  render :json => @inspection, :status => :created }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inspection.errors, :status => :unprocessable_entity }
        format.json  { render :json => @inspection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inspections/1
  # DELETE /inspections/1.xml
  def destroy
    @inspection = Inspection.find(params[:id])
    @inspection.destroy

    respond_to do |format|
      format.html { redirect_to(inspections_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
