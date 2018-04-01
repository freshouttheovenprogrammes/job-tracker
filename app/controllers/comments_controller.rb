class CommentsController < ApplicationController
  # before_action :set_comment_params, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    @comment.save

    redirect_to company_job_path(@comment.job.company, @comment.job)

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  #
  # def set_comment_params
  #   @job = Job.find(params[:id])
  # end
end
