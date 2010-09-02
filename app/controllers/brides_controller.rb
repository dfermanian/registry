class BridesController < ApplicationController
  def index
    @brides = Bride.all
  end
  
  def show
    @bride = Bride.find(params[:id])
  end
  
  def new
    @bride = Bride.new
    2.times do |b|
      gifts = @bride.gifts.build
    end
  end
  
  def create
    @bride = Bride.new(params[:bride])
    if @bride.save
      flash[:notice] = "Successfully created bride."
      redirect_to @bride
    else
      render :action => 'new'
    end
  end
  
  def edit
    @bride = Bride.find(params[:id])
  end
  
  def update
    @bride = Bride.find(params[:id])
    if @bride.update_attributes(params[:bride])
      flash[:notice] = "Successfully updated bride."
      redirect_to @bride
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @bride = Bride.find(params[:id])
    @bride.destroy
    flash[:notice] = "Successfully destroyed bride."
    redirect_to brides_url
  end
end
