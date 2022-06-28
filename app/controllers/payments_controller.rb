class PaymentsController < ApplicationController
  load_and_authorize_resource
  def index; end

  def show; end

  def new
    @payment = Payment.new
    @category = Category.find_by(id: params[:category_id])
    @categories = current_user.categories
  end

  def create
    category = Category.find_by(id: params[:payment][:category_id])
    @payment = Payment.new(payment_params)
    @payment.author = current_user
    if @payment.save
      if params[:payment][:category_ids] == ['']
        flash[:alert] = 'Please select at least one category'
        redirect_back fallback_location: root_path
      else
        params[:payment][:category_ids].each do |category_id|
          PaymentCategory.create(payment: @payment, category_id: category_id)
        end
        redirect_to category_path(category)
      end
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_ids)
  end
end
