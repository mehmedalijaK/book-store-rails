class Api::V1::OrdersController < ApplicationController
  before_action :authorize_request
  before_action :check_admin, except: [:show, :create]

  def index
    orders = Order.all
    render json: get_orders_json(orders), status: 200
  end

  def show
    order = Order.find_by(id: params[:id])
    if order
      render json: get_orders_json(order), status: 200
    else
      render json: {error: "Order not found."}, status: 404
    end
  end

  def get_orders_json(orders)
    orders.as_json(
      only: [:id, :status, :ordered_at, :scheduled_at, :address, :phone, :full_name],
      include: {
        order_items: {
          only: [:id, :quantity, :price_per_unit],
          include: {
            book: {
              only: [:id, :name, :description, :price, :created_at, :updated_at],
              include: {
                category: {
                  only: [:id, :name, :created_at, :updated_at]
                },
                authors: {
                  only: [:id, :name, :created_at, :updated_at]
                }
              }
            }
          }
        }
      }
    )
  end

  def create
    order = Order.new(order_params)

    if order.save
      render json: order, status: 200
    else
      render json: { error: "Error creating order!" }, status: 422
    end
  end

  def update
    order = Order.find_by(id: params[:id])

    if order
      if order.update(order_params)
        render json: order, status: 200
      else
        render json: { error: "Error updating order!" }, status: 422
      end
    else
      render json: { error: "Order not found." }, status: 404
    end
  end

  def destroy
    order = Order.find_by(id: params[:id])

    if order
      order.destroy
      render json: { message: "Order deleted successfully." }, status: 200
    else
      render json: { error: "Order not found." }, status: 404
    end
  end

  private
  def order_params
    params.require(:order).permit(
      :status,
      :ordered_at,
      :scheduled_at,
      :address,
      :phone,
      :full_name,
      order_items_attributes: [:quantity, :price_per_unit, :book_id]
    )
  end

end
