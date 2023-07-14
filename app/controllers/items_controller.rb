# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    # @item = Item.limit(4)
    @item = Item.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @item = Item.where(id: params[:id]).order(created_at: :desc).first
  end

  # GET /tasks/new
  def new
    @item = Item.new
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks or /tasks.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to task_url(@item), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to task_url(@item), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Item was successfully destroyed.' }

      format.json { head :no_content }
    end
  end

  def add_to_cart
    # 商品IDをキーとして、その数量を値とするハッシュをセッションに保存
    id = params[:id].to_s
    cart[id] = (cart[id] || 0) + (params[:quantity] ? params[:quantity].to_i : 1)

    redirect_to cart_item_path # カートの表示ページにリダイレクトする
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @item = Item.find(params[:id])
  end
end
