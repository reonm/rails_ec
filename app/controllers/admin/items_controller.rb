# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_auth, except: %i[index show]
    before_action :set_task, only: %i[show edit update destroy]

    def index
      @item = Item.limit(4)
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
        format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

    def set_task
      @item = Item.find(params[:id])
    end
    # def item_params
    #   params.require(:item).permit(:attribute1, :attribute2, :attribute3)
    # end
  end
end
