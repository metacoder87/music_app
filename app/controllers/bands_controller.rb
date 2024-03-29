class BandsController < ApplicationController
  before_action :require_user!

  # GET /bands or /bands.json
  def index
    @bands = Band.all
    render :index
  end

  # GET /bands/1 or /bands/1.json
  def show
    @band = Band.find(params[:id])
    render :show
  end

  # GET /bands/new
  def new
    @band = Band.new
    render :new
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  # POST /bands or /bands.json
  def create
    @band = Band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to band_url(@band), notice: "Band was successfully created." }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1 or /bands/1.json
  def update
    @band = Band.find(params[:id])
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to band_url(@band), notice: "Band was successfully updated." }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1 or /bands/1.json
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to bands_url, notice: "Band was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:name)
    end
end
