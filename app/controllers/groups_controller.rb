class GroupsController < ApplicationController
  before_action :set_group, only: %i[show update destroy]

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    # params.require(:group).permit(:name, :icon)
    params.permit(:name, :icon)
  end
end
