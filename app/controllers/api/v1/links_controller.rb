class Api::V1::LinksController < ApiBaseController
  respond_to :json

  def update
    link = Link.find(params[:id])
    # link.update(link_params)
    render json: link.update(link_params)
    # respond_with status: 204
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
