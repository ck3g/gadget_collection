class GadgetsController < ApplicationController
  authorize_resource

  before_action :find_gadget, only: [:show, :edit, :update]

  def index
    @gadgets = current_user.gadgets.order(created_at: :desc)
  end

  def show

  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = current_user.gadgets.new gadget_params
    if @gadget.save
      redirect_to gadgets_path, notice: 'Gadget created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gadget.update_attributes gadget_params
      redirect_to gadgets_path, notice: 'Gadget updated successfully'
    else
      render :edit
    end
  end

  private
  def gadget_params
    params.require(:gadget).permit(:name, :image)
  end

  def find_gadget
    @gadget = current_user.gadgets.find params[:id]
  end
end
