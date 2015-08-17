class JobsController < ApplicationController
  def index
    jobs = Job.all
    render json: jobs
  end

  def create
    job = Job.new(job_params)
    if job.save
      render json: job, status: :created
    else
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  def show
    job_id = job_ids
    begin
      job = Job.find(job_id)
      render json: job
    rescue ActiveRecord::RecordNotFound
      redirect_to :controller => "jobs", :action => "index"
    end
  end

  def job_params
    params.require(:job).permit(:url, :employer_name, :job_title, :job_description, :year_of_experience, :education_requirement, :industry, :base_salary)
  end

  def job_ids
    params.require(:id)
  end
end
