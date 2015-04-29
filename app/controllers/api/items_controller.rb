class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    list = List.find(:list_id)
    items = list.items
    render json: items, each_serializer: ItemSerializer
  end

  def create
    item = Item.new(name: params[:name], list_id: params[:list_id])
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # def item_params
  #   params.require(:item).permit(:name, :list_id)
  # end
end
