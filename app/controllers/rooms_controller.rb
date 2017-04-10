class RoomsController < ApplicationController
  before_action :load_room, only: [:update, :destroy]

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = t "view.room.add_room_success"
    else
      flash[:danger] = t "view.room.add_room_fail"
    end
    redirect_to :back
  end

  def update
    @room.update_attributes room_params
    if @room.save
      flash[:success] = t "view.room.update_room_success"
    else
      flash[:danger] = t "view.room.update_room_fail"
    end
    redirect_to :back
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def room_params
    params.require(:room).permit :name, :descript, :max_guest, :workspace_id
  end

  def load_room
    @room = Room.find_by id: params[:id]
    return if @room
    flash[:warning] = t "view.room.not_found_room"
    redirect_to :back
  end
end
