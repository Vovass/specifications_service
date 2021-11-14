class FieldsController < ApplicationController
  before_action :set_field, only: %i[ show edit update destroy ]
  before_action :set_retailer, only: %i[ new create ]
  before_action :cur_retailer, only: %i[ new create edit ]

  # GET /fields/1 or /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields or /fields.json
  def create
    @field = @retailer.fields.new(field_params)
      if @field.save
        @field.variations.new({name: "General", description: nil }).save
      redirect_to @retailer
      else
      render :new
    end
  end

  # PATCH/PUT /fields/1 or /fields/1.json
  def update # подумать
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to @field, notice: "Field was successfully updated." }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1 or /fields/1.json
  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to retailer_url(@field.retailer_id), notice: "Field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_field
    @field = Field.find(params[:id])
  end

  def set_retailer
    @retailer = Retailer.find(params[:retailer_id])
  end

  def cur_retailer
    @cur_retailer = @retailer || @field.retailer
  end

    # Only allow a list of trusted parameters through.
  def field_params
    params.require(:field).permit(:title, :description, :vocabulary_id)
  end
end
