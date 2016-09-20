class Api::V1::LinksController < ApiBaseController
  respond_to :json

  def index
    user = current_user
    render json: Link.where(user_id: user.id).order('lower(title)')
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      render json: link
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
