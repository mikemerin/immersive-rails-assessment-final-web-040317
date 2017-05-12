class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def show
    @appearance = Appearance.find_by(id: params[:id])
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @appearance.user_id = current_user.id
    if @appearance.save
      redirect_to @appearance.episode
    else
      flash[:notice] = "Sorry there is an invalid entry"
      redirect_to new_appearance_path
    end

    def edit
      byebug
      @appearance = Appearance.find_by(id: params[:id])
    end

    def update
      @appearance = Appearance.find_by(id: params[:id])
      if @appearance.update(appearance_params)
        redirect_to @appearance.episode
      else
        flash[:notice] = "Sorry there is an invalid entry"
        redirect_to edit_appearance_path(@appearance)
      end
    end

  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :user_id, :rating)
  end

end
