class OmisesController < ApplicationController
  before_action :set_omise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /omises
  # GET /omises.json
  def index
    @omises = Omise.all
  end

  # GET /omises/1
  # GET /omises/1.json
  def show
    @average = Review.where(:omise_id => params[:id]).average(:rating)
    @average_show = @average.round(1)
  end

  # GET /omises/new
  def new
    @omise = Omise.new
  end

  # GET /omises/1/edit
  def edit
  end

  # POST /omises
  # POST /omises.json
  def create
    @omise = Omise.new(omise_params)

    respond_to do |format|
      if @omise.save
        format.html { redirect_to @omise, notice: 'Omise was successfully created.' }
        format.json { render :show, status: :created, location: @omise }
      else
        format.html { render :new }
        format.json { render json: @omise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omises/1
  # PATCH/PUT /omises/1.json
  def update
    respond_to do |format|
      if @omise.update(omise_params)
        format.html { redirect_to @omise, notice: 'Omise was successfully updated.' }
        format.json { render :show, status: :ok, location: @omise }
      else
        format.html { render :edit }
        format.json { render json: @omise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omises/1
  # DELETE /omises/1.json
  def destroy
    @omise.destroy
    respond_to do |format|
      format.html { redirect_to omises_url, notice: 'Omise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omise
      @omise = Omise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omise_params
      params.require(:omise).permit(:name, :tel, :address, :homepage)
    end
end
