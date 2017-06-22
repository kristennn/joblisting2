class JobsController < ApplicationController
before_action :authenticate_user!, :only => [:new, :create]
  def index
  @jobs = case params[:order]
  when 'by_lower_bound'
    Job.where(is_hidden: false).order('wage_lower_bound DESC')
  when 'by_upper_bound'
    Job.where(is_hidden: false).order('wage_upper_bound DESC')
  else
    Job.where(is_hidden: false).order('created_at DESC')
  end
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
