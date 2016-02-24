class PracticesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_practice, only: [:show, :edit, :update, :destroy]
  before_action :set_practice_type, only: [:index, :new, :create]
  layout 'admin_big'

  # GET /practices
  # GET /practices.json
  def index
    @practices = Practice.all
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
  end

  # GET /practices/new
  def new
    @practice = Practice.new
    @practice.practice_type = @practice_type
  end

  # GET /practices/1/edit
  def edit
  end

  # POST /practices
  # POST /practices.json
  def create
    @practice = Practice.new(practice_params)

    respond_to do |format|
      if @practice.save
        format.html { redirect_to @practice.practice_type, notice: 'Practice was successfully created.' }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practices/1
  # PATCH/PUT /practices/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to @practice.practice_type, notice: 'Practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practice_types_url, notice: 'Practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end

    def set_practice_type
      @practice_type = PracticeType.find(params[:practice_type_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practice_params
      params.require(:practice).permit(:title, :info, :practice_type_id)
    end
end
