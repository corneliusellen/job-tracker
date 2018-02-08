class JobsController < ApplicationController
  def index
    if params[:sort]
      render :location
    else
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    end
  end

  def location
    
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(title: params[:job][:title], description: params[:job][:description], level_of_interest: params[:job][:level_of_interest], city: params[:job][:city], category_id: params[:category])
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(title: params[:job][:title], description: params[:job][:description], level_of_interest: params[:job][:level_of_interest], city: params[:job][:city], category_id: params[:category])
    if @job.save
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to company_jobs_path(params[:company_id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
