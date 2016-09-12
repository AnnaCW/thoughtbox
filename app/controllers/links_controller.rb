class LinksController < ApplicationController
  before_action :require_current_user

  # def new
  #   @link = Link.new
  # end

  def create
    user = current_user
    link = user.links.create(link_params)

    if link.save
      redirect_to links_path
    else
      flash.now[:error] = "Invalid. Try Again"
    end
  end

  def index
    user = current_user
    @links = Link.where(user_id: user.id)
  end

  private

  def require_current_user
    render file: '/public/404' unless current_user
  end

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
