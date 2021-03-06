class WandsController < ApplicationController
  before_action :check_session

  def new
    @wand = Wand.new
    @cores = Core.all
    @woods = Wood.all
  end

  def create
    @wand = Wand.create(wand_params)
    if @wand.valid?
      flash[:type] = "success"
      flash[:message] = "The wand chooses the wizard, #{@character.name}."
      redirect_to character_path(@character)
    else
      flash[:message] = 'Wand Can Not Be Created'
      redirect_to new_character_wand_path
    end
  end

  def edit
    @wand = @character.wand
    @cores = Core.all
    @woods = Wood.all
  end

  def update
    @wand = @character.wand
    @wand.update(wand_params)
    if @wand.valid?
      redirect_to character_path(@character)
    else
      flash[:message] = 'Wand Can Not Be Edited'
      redirect_to edit_character_wand_path
    end
  end

  private

  def wand_params
    params[:wand][:character_id] = session[:character_id]
    params.require(:wand).permit(:wood_id, :core_id, :character_id)
  end
end
