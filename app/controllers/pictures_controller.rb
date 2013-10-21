class PicturesController < ApplicationController
  before_action :find_gadget

  def create
    @picture = @gadget.pictures.new picture_params
    if @picture.save
      redirect_to gadget_path(@gadget), notice: 'Picture uploaded'
    else
      render 'gadgets/show'
    end
  end

  private
  def find_gadget
    @gadget = current_user.gadgets.find params[:gadget_id]
  end

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
