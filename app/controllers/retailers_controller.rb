class RetailersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_retailer, only: %i[ show edit update destroy ]
  before_action :check_role, only: %i[ new edit ]

  # GET /retailers or /retailers.json
  def index
    @retailers = params[:search].nil? ? Retailer.all.page(params[:page]) : Retailer.search(params[:search])
  end

  # GET /retailers/1 or /retailers/1.json
  def show
  end

  # GET /retailers/new
  def new
    @retailer = Retailer.new
  end

  # GET /retailers/1/edit
  def edit
  end

  # POST /retailers or /retailers.json
  def create
    @retailer = current_user.retailers.new(retailer_params)

    respond_to do |format|
      if @retailer.save
        format.html { redirect_to @retailer, notice: "Ретейлер был успешно создан." }
        format.json { render :show, status: :created, location: @retailer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retailers/1 or /retailers/1.json
  def update
    respond_to do |format|
      if @retailer.update(retailer_params)
        format.html { redirect_to @retailer, notice: "Ретейлер был успешно обновлен." }
        format.json { render :show, status: :ok, location: @retailer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retailers/1 or /retailers/1.json
  def destroy
    @retailer.destroy
    respond_to do |format|
      format.html { redirect_to retailers_url, notice: "Ретейлер был успешно удален." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    def check_role
      respond_to { |format| format.html { redirect_to retailers_path, alert: "У вас нету доступа к просмотру содержимого этой страницы" } } unless ["QA","admin"].include? current_user.role
    end

  # Only allow a list of trusted parameters through.
    def retailer_params
      params.require(:retailer).permit(:title)
    end
end
