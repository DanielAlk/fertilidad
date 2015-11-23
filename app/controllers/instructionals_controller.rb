class InstructionalsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]
  before_action :set_instructional, only: [:show, :edit, :update, :destroy]
  before_action :get_schedules, only: [:index, :show]
  layout 'admin_big', only: [:new, :edit]

  # GET /instructionals
  # GET /instructionals.json
  def index
    @instructionals = Instructional.all
  end

  # GET /instructionals/1
  # GET /instructionals/1.json
  def show
  end

  # GET /instructionals/new
  def new
    @instructional = Instructional.new
  end

  # GET /instructionals/1/edit
  def edit
  end

  # POST /instructionals
  # POST /instructionals.json
  def create
    @instructional = Instructional.new(instructional_params)

    respond_to do |format|
      if @instructional.save
        format.html { redirect_to @instructional, notice: 'Instructional was successfully created.' }
        format.json { render :show, status: :created, location: @instructional }
      else
        format.html { render :new }
        format.json { render json: @instructional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructionals/1
  # PATCH/PUT /instructionals/1.json
  def update
    respond_to do |format|
      if @instructional.update(instructional_params)
        format.html { redirect_to @instructional, notice: 'Instructional was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructional }
      else
        format.html { render :edit }
        format.json { render json: @instructional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructionals/1
  # DELETE /instructionals/1.json
  def destroy
    @instructional.destroy
    respond_to do |format|
      format.html { redirect_to instructionals_url, notice: 'Instructional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructional
      @instructional = Instructional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructional_params
      params.require(:instructional).permit(:title, :subtitle, :text)
    end
end
