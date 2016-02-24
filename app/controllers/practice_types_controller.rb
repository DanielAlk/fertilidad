class PracticeTypesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_practice_type, only: [:show, :edit, :update, :destroy]
  layout 'admin_big'

  # GET /practice_types
  # GET /practice_types.json
  def index
    @practice_types = PracticeType.all
  end

  # GET /practice_types/1
  # GET /practice_types/1.json
  def show
  end

  # GET /practice_types/new
  def new
    @practice_type = PracticeType.new
  end

  # GET /practice_types/1/edit
  def edit
  end

  # POST /practice_types
  # POST /practice_types.json
  def create
    @practice_type = PracticeType.new(practice_type_params)

    respond_to do |format|
      if @practice_type.save
        format.html { redirect_to @practice_type, notice: 'Practice type was successfully created.' }
        format.json { render :show, status: :created, location: @practice_type }
      else
        format.html { render :new }
        format.json { render json: @practice_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practice_types/1
  # PATCH/PUT /practice_types/1.json
  def update
    respond_to do |format|
      if @practice_type.update(practice_type_params)
        format.html { redirect_to @practice_type, notice: 'Practice type was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice_type }
      else
        format.html { render :edit }
        format.json { render json: @practice_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practice_types/1
  # DELETE /practice_types/1.json
  def destroy
    @practice_type.destroy
    respond_to do |format|
      format.html { redirect_to practice_types_url, notice: 'Practice type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice_type
      @practice_type = PracticeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practice_type_params
      params.require(:practice_type).permit(:title)
    end
end
