class GadgetsController < ApplicationController
  authorize_resource

  def index
    @gadgets = Gadget.order(created_at: :desc)
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

  private
  def gadget_params
    params.require(:gadget).permit(:name, :image)
  end
end
