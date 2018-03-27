class JobsController < ApplicationController
  before_action :set_job_params, only: [:show, :edit, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} was updated"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted"
    redirect_to company_jobs_path(@company)
  end

  private

  def set_job_params
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
