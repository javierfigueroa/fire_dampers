require 'aws-sdk'

class Report < ActiveRecord::Base
   attr_accessible :cover_image, 
                  :cover_image_content_type, 
                  :cover_image_file_size,
                  :pdf_report, 
                  :pdf_report_content_type, 
                  :pdf_report_file_size,
                  :user_id,
                  :job_id
  has_attached_file :cover_image,
    :storage => :s3,
    :s3_credentials => Rails.root.join('config', 's3_reports.yml').to_s,  
    :path => '/:id/images/:filename'
    
  has_attached_file :pdf_report,
    :storage => :s3,
    :s3_credentials => Rails.root.join('config', 's3_reports.yml').to_s,  
    :path => '/:id/reports/:filename'
                  
  belongs_to :job
  
  def renderPDF
    @report = self
    @job = Job.find(@report.job)    
    @inspections = Inspection.where(:job_id => @job.id)
    @technicians = Technician.where(:user_id => @report.user_id)
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
    
     # setup paths
     outfile_path = '/tmp'# "Rails.root.join('public','pdfs')
     view_path   = Rails.root.join('app','views','reports')

     # parse erb templates
     body = File.read(view_path.join('show.pdf.erb'))
     body_render = ERB.new(body).result(binding)

     # run through wicked_pdf
     pdf = WickedPdf.new.pdf_from_string(body_render,
        # :pdf => "breakfast", 
        :layout => false, 
        :margin => { :left => 20, :right => 5 }
     )

    # then save to a file
    File.open(outfile_path.join("#{@report.id}.pdf"), 'w') {|f| f << pdf }

    File.open(outfile_path.join("#{@report.id}.pdf")) do |f|
      @report.pdf_report = f # just assign the logo attribute to a file
      @report.save
    end #file gets closed automatically here
    
    # sleep(10.seconds)
    File.delete(outfile_path.join("#{@report.id}.pdf"))
  end
end
