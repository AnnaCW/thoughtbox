class Api::V1::LinksController < ApiBaseController
  respond_to :json

  def index
    render json: Link.order(title: :asc)
  end

  def update
    link = Link.find(params[:id])
    render json: link.update(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
