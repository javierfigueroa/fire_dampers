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
    user = User.find(@report.user_id)
    @company = Company.find(user.company)
    
    # format = request.format
    # if format == "application/pdf"
#       
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
      format.pdf { 
      render(:pdf => "breakfast", :layout => false, :show_as_html => params[:debug].present? ) }
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
