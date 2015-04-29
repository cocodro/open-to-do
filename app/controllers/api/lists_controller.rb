class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    user = User.find(params[:id])
    lists = user.lists
    render json: lists, each_serializer: ListSerializer
  end

  def create
    list = List.new(title: params[:title], user_id: params[:user_id])
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  # def list_params
  #   params.require(:list).permit(:title, :user_id)
  # end
end
