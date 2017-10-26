class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :convert_date_time_str, only: [:edit]

  helper OrdersHelper

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order(status: :asc, deadline: :asc)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
   
    begin
      params = order_params
      params[:deadline] = helpers.convert_str_date_time(params[:deadline])
      @order = Order.new(order_params.merge(:status => 'created'))
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    rescue InvalidDateFormat => e
      respond_to do |format|
        format.html {redirect_to request.referrer, notice: e.msg}
      end
    end 
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    params = order_params
    begin
      params[:deadline] = helpers.convert_str_date_time(params[:deadline])
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    rescue InvalidDateFormat => e
      respond_to do |format|
        format.html {redirect_to request.referrer, notice: e.msg}
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.update_column("status","finalized")
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order #{@order.title} was successfully finalized!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      order_params = params.require(:order).permit(:title, :description, :deadline)
    end

    def convert_date_time_str
      set_order
      @order.deadline = helpers.format(@order.deadline)
    end
end
