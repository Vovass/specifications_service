class FieldHistoriesController < ApplicationController
  before_action :set_field_history, only: %i[ show update destroy ]
  before_action :set_field, only: %i[ update ]

  # GET /field_histories or /field_histories.json
  def index
    @retailer = Retailer.find(params[:retailer_id])
    # @field_histories = FieldHistory.all.order(updated_at: :desc)
  end

  # GET /field_histories/1 or /field_histories/1.json
  def show
  end

  # POST /field_histories or /field_histories.json
  def create
    @field_history = FieldHistory.new(field_history_params)

    respond_to do |format|
      if @field_history.save
        format.html { redirect_to @field_history, notice: "История поля была успешно создан." }
        format.json { render :show, status: :created, location: @field_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_histories/1 or /field_histories/1.json
  def update
    restore_history_content
  end

  def restore_history_content
    respond_to do |format|
      binding.pry
      if @field.update(history_restored_params)
        FieldHistory.new(field_history_restored_params).save!
        format.html { redirect_to retailer_path(@field.retailer_id), notice: "Поле успешно возвращено из истори." }
        format.json { render :show, status: :ok, location: retailer_path(@field.retailer_id) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_history
      @field_history = FieldHistory.find(params[:id])
    end

    def set_field
      @field = Field.find(@field_history[:field_id])
    end

    def set_variation
      @variation = Variation.find(@field_history[:variation_id])
    end

    # Only allow a list of trusted parameters through.
    def field_history_params
      params.require(:field_history).permit(:fields_title, :variation_name, :description, :version)
    end

    def history_restored_params
      {
        title: @field_history.fields_title,
        description: @field_history.description,
      }
    end

    def field_history_restored_params
      {
        field_id: @field[:id],
        retailer_id: @field.retailer_id,
        fields_title: @field.vocabulary.spec_name,
        variation_name: nil,
        description: nil,
        vocabulary_name: @field.vocabulary.name,
        user_id: current_user.id
      }
    end
end
