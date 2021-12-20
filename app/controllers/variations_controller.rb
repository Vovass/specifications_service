class VariationsController < ApplicationController
  before_action :set_variation, only: %i[ show edit update destroy ]
  before_action :set_field, only: %i[ new create ]
  before_action :check_role, only: %i[ new show edit ]

  # GET /variations or /variations.json
  def index
    @variations = Variation.all
  end

  # GET /variations/1 or /variations/1.json
  def show
  end

  # GET /variations/new
  def new
    @variation = Variation.new
  end

  # GET /variations/1/edit
  def edit
  end

  # POST /variations or /variations.json
  def create
    @variation = @field.variations.new(variation_params.merge(user_id: current_user.id))
    if @variation.save
      FieldHistory.new(variation_history_params).save!
      redirect_to @field.retailer
    else
      render :new
    end
  end

  # PATCH/PUT /variations/1 or /variations/1.json
  def update
    respond_to do |format|
      if @variation.update(variation_params)
        FieldHistory.new(variation_history_params(_update: true)).save!
        format.html { redirect_to @variation.field.retailer, :"data-turbolinks" => "false", notice: "Variation was successfully updated." }
        format.json { render :show, status: :ok, location: @variation.field.retailer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variations/1 or /variations/1.json
  def destroy
    FieldHistory.new(variation_history_params(_destroy: @variation.name)).save!
    @variation.destroy
    respond_to do |format|
      format.html { redirect_to @variation.field.retailer, notice: "Variation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variation
      @variation = Variation.find(params[:id])
    end

    def set_field
      @field = Field.find(params[:field_id])
    end

    def check_role
      respond_to { |format| format.html { redirect_to @field&.retailer || @variation.field.retailer, alert: "You do not have access to view this page" } } unless ["QA","admin"].include? current_user.role
    end


    def variation_history_params(_destroy: false, _update: false)
        return {
          field_id: @variation[:field_id],
          retailer_id: @variation.field.retailer_id,
          fields_title: "Variation #{_destroy} - destroyed",
          variation_name: "Variation #{_destroy} - destroyed",
          description: "Variation #{_destroy} - destroyed",
          vocabulary_name: "Variation #{_destroy} - destroyed",
          user_id: current_user.id
        } if _destroy

        return {
          field_id: @variation[:field_id],
          retailer_id: @variation.field.retailer_id,
          fields_title: @variation.field.title,
          variation_name: @variation.name,
          description: @variation.description,
          vocabulary_name: @variation.field.vocabulary.name,
          user_id: current_user.id
        } if _update

        {
          field_id: @variation[:field_id],
          retailer_id: @variation.field.retailer_id,
          fields_title: @variation.field.title,
          variation_name: "Create new variation: #{@variation.name}",
          description: @variation.description,
          vocabulary_name: @variation.field.vocabulary.name,
          user_id: current_user.id
        }
      end

    # Only allow a list of trusted parameters through.
      def variation_params
        params.require(:variation).permit(:name, :description)
      end
end
