class Admin::OrdersController < ApplicationController
  layout "admin"
  def index
    @status_counts = Order.count_by_status
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find_by(id: params[:id])
    order.destroy
    order.save
    redirect_to admin_order_index_path
  end

end
