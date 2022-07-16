class GroupsController < ApplicationController
  before_action :set_user
  before_action :set_group, only: %i[destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.where(user: current_user)
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new

  def create
    add_group = current_user.group.new(group_params)
    # @group = Group.new(group_params)

    if add_group.save
      # render json: @group, status: :created, location: @group
      redirect_to groups_path, notice: 'Category added successfully'
    else
      # render json: @group.errors, status: :unprocessable_entity
      render :new, status: :unprocessable_entity, alert: 'Failed to add category'
    end
  end

  def destroy
    @user = current_user
    @group = Group.find(params[:id])

    if @group.destroy
      redirect_to groups_path, notice: 'Category removed successfully'
    else
      render :index, alert: 'Failed to remove category'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def group_params
    # params.require(:group).permit(:name, :icon)
    params.permit(:name, :icon)
  end
end
