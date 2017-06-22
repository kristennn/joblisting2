class Admin::ResumesController < ApplicationController

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')
  end

end
