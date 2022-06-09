class GuestsController < ApplicationController
  before_action :set_guest, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [ :index, :edit, :update, :destroy, :show ]
  before_action :correct_user, only: [:index, :edit, :update, :destroy, :show ]

  # GET /guests or /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1 or /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = current_user.guests.build
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests or /guests.json
  def create
    @guest = current_user.guests.build(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to home_questionaire_path(:guest_name => @guest.last_name << @guest.first_name,:id => @guest.id), notice: "Guest was successfully created." }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: "Guest was successfully updated." }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1 or /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :answered_yes, :user_id)
    end
end
