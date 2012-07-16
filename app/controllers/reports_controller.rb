class ReportsController < ApplicationController
  before_filter :authenticate_user!
  # GET /reports
  # GET /reports.xml
  def index
    @reports = Report.accessible_by(current_ability, :read)
     
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
  def show
    @report = Report.find(params[:id])
    @job = Job.find(@report.job)    
    @inspections = Inspection.where(:job_id => @job.id)
    @technicians = Technician.accessible_by(current_ability, :read)
    user = User.find(@report.user_id)
    @company = Company.find(user.company)
    
    #fire dampers summary
    @floor_totals = Hash.new
    @floor_percentage_totals = Hash.new
    @floor_totals["fire"] = @floor_percentage_totals["fire"] = 
    @floor_totals["smoke"] = @floor_percentage_totals["smoke"] =
    @floor_totals["pass"] = @floor_percentage_totals["pass"] =
    @floor_totals["fail"] = @floor_percentage_totals["fail"] =
    @floor_totals["vine"] = @floor_percentage_totals["vine"] =
    @floor_totals["repair"] = @floor_percentage_totals["repair"] = 
    @floor_totals["total"] = @floor_percentage_totals["total"] = 0;
    
    @floor_summaries = Array.new
    @floor_percentages = Array.new
    total_inspections = @inspections.count
    
    inspection_floors = @inspections.select('floor').all(:group => 'floor',  :conditions => ["job_id = ?", @job.id])
    inspection_floors.each do |inspection_floor|
      floor = inspection_floor.floor
      summary = Hash.new
      percentages = Hash.new
      
      summary["floor"] = floor
      percentages["floor"] = floor
      summary["fire"] = @inspections.count(:all, :conditions => ["floor = ? and damper_type_id = ?", floor, DamperType.where(:abbrev => "FD")])
      @floor_totals["fire"] += summary["fire"]      
      percentages["fire"] = (summary["fire"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["fire"] += percentages["fire"]
      
      summary["smoke"] = @inspections.count(:all, :conditions => ["floor = ? and damper_type_id = ?",floor,  DamperType.where(:abbrev => "PCD")])
      @floor_totals["smoke"] += summary["smoke"]      
      percentages["smoke"] = (summary["smoke"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["smoke"] += percentages["smoke"]
      
      summary["pass"] = @inspections.count(:all, :conditions => ["floor = ? and damper_status_id = ?",floor,  DamperStatus.where(:abbrev => "OK")])
      @floor_totals["pass"] += summary["pass"]
      percentages["pass"] = (summary["pass"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["pass"] += percentages["pass"]
      
      summary["fail"] = @inspections.count(:all, :conditions => ["floor = ? and damper_status_id = ?", floor, DamperStatus.where(:abbrev => "FAIL")])
      @floor_totals["fail"] += summary["fail"]
      percentages["fail"] = (summary["fail"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["fail"] += percentages["fail"]
      
      summary["vine"] = @inspections.count(:all, :conditions => ["floor = ? and damper_type_id = ?", floor, DamperType.where(:abbrev => "VINE")])
      @floor_totals["vine"] += summary["vine"]
      percentages["vine"] = (summary["vine"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["vine"] += percentages["vine"]
      
      summary["repair"] = @inspections.count(:all, :conditions => ["floor = ? and damper_type_id = ?", floor, DamperType.where(:abbrev => "FNR")])
      @floor_totals["repair"] += summary["repair"]
      percentages["repair"] = (summary["repair"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["repair"] += percentages["repair"]
      
      summary["total"] = @inspections.count(:all, :conditions => ["floor = ?", floor])
      @floor_totals["total"] += summary["total"]
      percentages["total"] = (summary["total"].to_f / total_inspections.to_f) * 100.0
      @floor_percentage_totals["total"] += percentages["total"]
      
      @floor_summaries.push(summary)
      @floor_percentages.push(percentages)
    end
    
    
    # format = request.format
    # if format == "application/pdf"
#       
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
      format.pdf { 
      render( :pdf => "breakfast", 
              :layout => false, 
              :show_as_html => params[:debug].present?,
              :margin => { :left => 20, :right => 5 } ) }
    end
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
    @report = Report.new
    @jobs = Job.accessible_by(current_ability, :read)
    if @jobs.count == 0
      respond_to do |format|
        format.html { redirect_to(reports_path, :notice => "No jobs available. You need jobs to create reports.") }
        format.xml  { render :xml => @inspection, :status => :unprocessable_entity, :location => reports_path }
        format.json  { render :json => @inspection, :status => :unprocessable_entity, :location => reports_path }
      end
    else
      @company = nil
      if current_user.role? :admin
        @company = Company.find(1);
      else
        @company = Company.find(current_user.company)
      end

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @report }
      end
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.xml
  def create
    @report = Report.new(params[:report])
    if (!params[:report][:user_id])
      @report.user_id = current_user.id;
    end
    
    format = request.format
    if format == "application/pdf"
      
    end

    respond_to do |format|
      if @report.save
        format.html { redirect_to(@report, :notice => 'Report was successfully created.') }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(@report, :notice => 'Report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
end
