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
    @field = @retailer.fields.new(field_params.merge(user_id: current_user.id))
      if @field.save
        if @field.variations.new({name: "General", description: nil }.merge(user_id: current_user.id)).save
          FieldHistory.new(field_history_params).save!
        end
      redirect_to @retailer
      else
      render :new
    end
  end

  # PATCH/PUT /fields/1 or /fields/1.json
  def update # подумать
    respond_to do |format|
      if @field.update(field_params)
        FieldHistory.new(field_history_params(_update: true)).save!
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
    FieldHistory.new(field_history_params(_destroy: @field.title)).save!
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

  def field_history_params(_destroy: false, _update: false)
    return {
      field_id: @field[:id],
      retailer_id: @field.retailer_id,
      fields_title: "Field #{_destroy} - destroyed",
      variation_name: "Field #{_destroy} - destroyed",
      description: "Field #{_destroy} - destroyed",
      vocabulary_name: "Field #{_destroy} - destroyed",
      user_id: current_user.id
    } if _destroy

    return {
      field_id: @field[:id],
      retailer_id: @field.retailer_id,
      fields_title: @field.vocabulary.spec_name,
      variation_name: nil,
      description: nil,
      vocabulary_name: @field.vocabulary.name,
      user_id: current_user.id
    } if _update

    {
      field_id: @field[:id],
      retailer_id: @field.retailer_id,
      fields_title: @field.vocabulary.spec_name,
      variation_name: @field.variations.first.name,
      description: nil,
      vocabulary_name: @field.vocabulary.name,
      user_id: current_user.id
    }
  end
end
