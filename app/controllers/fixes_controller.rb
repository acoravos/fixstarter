class FixesController < ApplicationController

  def show
    if @fix = Fix.find_by(id: params[:id])
      @issue = @fix.issue
      @comments = @fix.fix_comments.map { |comment| comment.package_info }
    else
      redirect_to welcome_index_path
    end
  end

  def new
    @issue = Issue.find(params[:issue_id])
  end

  def create
    issue = Issue.find(params[:issue_id])
    @fix = Fix.new(fix_params)
    # p "************"
    # p current_user
    # current_user.fixes << @fix
    if @fix.save
      issue.status = "closed"
      issue.save
    end
    redirect_to issue_path(id: issue.id)
  end

  def fix_params
    params.permit(:title, :description, :issue_id)
  end

end
