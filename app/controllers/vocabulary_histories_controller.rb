class VocabularyHistoriesController < ApplicationController
  before_action :set_vocabulary_history, only: %i[ show update ]
  before_action :set_vocabulary, only: %i[ update ]

  # GET /vocabulary_histories or /vocabulary_histories.json
  def index
    @vocabulary_histories = VocabularyHistory.all.order(updated_at: :desc).page(params[:page])
  end

  # GET /vocabulary_histories/1 or /vocabulary_histories/1.json
  def show
  end

  # POST /vocabulary_histories or /vocabulary_histories.json
  def create
    @vocabulary_history = VocabularyHistory.new(vocabulary_history_params)

    respond_to do |format|
      if @vocabulary_history.save
        format.html { redirect_to @vocabulary_history, notice: "История поля вокабуляра была успешно создана." }
        format.json { render :show, status: :created, location: @vocabulary_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulary_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabulary_histories/1 or /vocabulary_histories/1.json
  def update
    restore_history_content
  end

  def restore_history_content
    respond_to do |format|
      if @vocabulary.update(history_restored_params)
        VocabularyHistory.new(vocabulary_history_restored_params).save!
        format.html { redirect_to @vocabulary, notice: "Поле вокабуляра было успешно возвращено из истории." }
        format.json { render :show, status: :ok, location: @vocabulary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary_history
      @vocabulary_history = VocabularyHistory.find(params[:id])
    end

    def set_vocabulary
      @vocabulary = Vocabulary.find(@vocabulary_history[:vocabulary_id])
    end

    # Only allow a list of trusted parameters through.
    def vocabulary_history_params
      params.require(:vocabulary_history).permit(:name, :description, :spec_name)
    end

    def vocabulary_histories_params
      params.require(:vocabulary_histories).permit(:name, :description, :spec_name)
    end

  def history_restored_params
    {
      name: @vocabulary_history.name,
      description: @vocabulary_history.description,
      spec_name: @vocabulary_history.spec_name
    }
  end

  def vocabulary_history_restored_params
    {
      vocabulary_id: @vocabulary[:id],
      name: @vocabulary_history.name,
      description:  @vocabulary_history.description,
      spec_name: @vocabulary_history.spec_name,
      user_id: current_user.id
    }
  end
end
