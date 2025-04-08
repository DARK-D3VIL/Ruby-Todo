class TodoItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_item, only: %i[show edit update destroy]

  # GET /todo_items
  def index
    @todo_items = TodoItem.by_user(current_user)
  
    if params[:title].present?
      @todo_items = @todo_items.where("LOWER(title) LIKE ?", "%#{params[:title].downcase}%")
    end
  
    if params[:priority].present?
      @todo_items = @todo_items.where(priority: params[:priority])
    end
  
    if params[:due_date].present?
      @todo_items = @todo_items.where("due_date <= ?", params[:due_date])
    end
  end

  # GET /todo_items/1
  def show
    # @todo_item is already set by before_action
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItem.new
  end

  # GET /todo_items/1/edit
  def edit
    # @todo_item is already set by before_action
  end

  # POST /todo_items
  def create
    @todo_item = TodoItem.new(todo_item_params)
    @todo_item.user = current_user

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to @todo_item, notice: "Todo item was successfully created." }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_item, notice: "Todo item was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  def destroy
    @todo_item.destroy

    respond_to do |format|
      format.html { redirect_to todo_items_path, status: :see_other, notice: "Todo item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Set todo item scoped to current user
  def set_todo_item
    @todo_item = TodoItem.by_user(current_user).find(params[:id])
  end

  # Permit required parameters
  def todo_item_params
    params.require(:todo_item).permit(:title, :description, :due_date, :priority)
  end
end
