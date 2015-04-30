class Api::ListsController < ApiController
  before_action :authenticated?
  before_action :require_update_permission, :only => [:update]

  def index
    user = User.find(params[:user_id])
    lists = user.lists
    render json: lists, each_serializer: ListSerializer
  end

  def create
    user = User.find(params[:user_id])
    user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
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

  def list_params
    params.require(:list).permit(:title)
  end

  def require_update_permission
    list = List.find(params[:id])
    unless list.public? || list.user.id == params[:user_id]
  end
end
