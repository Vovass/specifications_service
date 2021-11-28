class FieldHistoriesController < ApplicationController
  before_action :set_field_history, only: %i[ show edit update destroy ]

  # GET /field_histories or /field_histories.json
  def index
    @field_histories = FieldHistory.all
  end

  # GET /field_histories/1 or /field_histories/1.json
  def show
  end

  # GET /field_histories/new
  def new
    @field_history = FieldHistory.new
  end

  # GET /field_histories/1/edit
  def edit
  end

  # POST /field_histories or /field_histories.json
  def create
    @field_history = FieldHistory.new(field_history_params)

    respond_to do |format|
      if @field_history.save
        format.html { redirect_to @field_history, notice: "Field history was successfully created." }
        format.json { render :show, status: :created, location: @field_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_histories/1 or /field_histories/1.json
  def update
    respond_to do |format|
      if @field_history.update(field_history_params)
        format.html { redirect_to @field_history, notice: "Field history was successfully updated." }
        format.json { render :show, status: :ok, location: @field_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_histories/1 or /field_histories/1.json
  def destroy
    @field_history.destroy
    respond_to do |format|
      format.html { redirect_to field_histories_url, notice: "Field history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_history
      @field_history = FieldHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def field_history_params
      params.require(:field_history).permit(:fields_title, :variation_name, :description, :verstion)
    end
end
