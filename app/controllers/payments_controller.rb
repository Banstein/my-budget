class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show update destroy]

  # GET /items
  def index
    @group = Group.find(params[:group_id])
    @payments = Payment.where(group_id: @group.id).order(id: :desc)
    # @total_amount = @payments.sum(:amount)
  end

  # POST /items
  def create
    @payments = current_user.payment.new(payment_params)

    if @payments.save
      redirect_to group_payments_path, notice: 'Transaction added successfully'
    else
      render :new, alert: 'Failed to add transaction'
    end
  end

  # DELETE /items/1
  def destroy
    @payments = Payment.find(params[:id])

    if @payment.destroy
      redirect_to group_payments_path, notice: 'Transaction removed successfully'
    else
      render :index, alert: 'Failed to remove Transaction'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @payment = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.permit(:name, :amount, :group_id)
  end
end
