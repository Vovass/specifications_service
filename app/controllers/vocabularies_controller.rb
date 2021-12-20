class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: %i[ show edit update destroy ]
  before_action :check_role, only: %i[ new edit ]

  # GET /vocabularies or /vocabularies.json
  def index
    @vocabularies = Vocabulary.all
  end

  # GET /vocabularies/1 or /vocabularies/1.json
  def show
  end

  # GET /vocabularies/new
  def new
    @vocabulary = Vocabulary.new
  end

  # GET /vocabularies/1/edit
  def edit
  end

  # POST /vocabularies or /vocabularies.json
  def create
    @vocabulary = current_user.vocabularies.new(vocabulary_params)

    respond_to do |format|
      if @vocabulary.save
        VocabularyHistory.new(vocabulary_history_params).save!
        format.html { redirect_to @vocabulary, notice: "Vocabulary was successfully created." }
        format.json { render :show, status: :created, location: @vocabulary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabularies/1 or /vocabularies/1.json
  def update
    respond_to do |format|
      if @vocabulary.update(vocabulary_params)
        VocabularyHistory.new(vocabulary_history_params).save!
        format.html { redirect_to @vocabulary, notice: "Vocabulary was successfully updated." }
        format.json { render :show, status: :ok, location: @vocabulary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabularies/1 or /vocabularies/1.json
  def destroy
    VocabularyHistory.new(vocabulary_history_params(_destroy: @vocabulary.name)).save!
    @vocabulary.destroy
    respond_to do |format|
      format.html { redirect_to vocabularies_url, notice: "Vocabulary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vocabulary_params
      params.require(:vocabulary).permit(:name, :description, :spec_name, :vocabulary_id)
    end

    def check_role
      respond_to { |format| format.html { redirect_to vocabularies_path, alert: "You do not have access to view this page" } } unless ["QA","admin"].include? current_user.role
    end

    def vocabulary_history_params(_destroy: false)
      return {
        vocabulary_id: @vocabulary[:id],
        name: "Vocabulary field #{_destroy} - destroyed",
        description: "Vocabulary field #{_destroy} - destroyed",
        spec_name: "Vocabulary field #{_destroy} - destroyed",
        user_id: current_user.id
      } if _destroy

      {
        vocabulary_id: @vocabulary[:id],
        name: vocabulary_params[:name],
        description: vocabulary_params[:description],
        spec_name: vocabulary_params[:spec_name],
        user_id: current_user.id
      }
    end
end
