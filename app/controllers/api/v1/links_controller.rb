class Api::V1::LinksController < ApiBaseController
  respond_to :json

  def index
    render json: Link.where(user_id: params[:user_id]).order('lower(title)')
  end

  def update
    link = Link.find(params[:id])
    link.update(link_params)
    render json: link
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
