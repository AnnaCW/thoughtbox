class LinksController < ApplicationController
  before_action :require_current_user

  def create
    user = current_user
    link = user.links.create(link_params)
    if link.save
      flash[:success] = "Your link has been saved."
    else
      flash[:error] = link.errors.full_messages.join(", ")
    end
    redirect_to links_path
  end

  def index
    user = current_user
    @links = Link.where(user_id: user.id)
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Your updates have been saved."
      redirect_to links_path
    else
      flash.now[:error] = @link.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def require_current_user
    render file: '/public/404' unless current_user
  end

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
