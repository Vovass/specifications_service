class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :check_role, only: %i[ edit ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all.order(updated_at: :desc).page(params[:page])
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    field_id = params.dig(:field_id)
    if field_id
      @ticket = Ticket.new({name: "QA", description: "Заполнить спецификацию для текущего поля т.к. данные на сайте устарели", field_ids: field_id.to_i, user_id: current_user.id})
      respond_to do |format|
        if @ticket.save
          retailer = Field.find(field_id).retailer
          format.html { redirect_to retailer, notice: "Задача была успешно создана." }
          format.json { render :show, status: :created, location: retailer }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    else
      @ticket = Ticket.new
    end
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: "Задача была успешно создана." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: "Задача была успешно обновлена." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Задача была успешно удалена." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

  def check_role
    respond_to { |format| format.html { redirect_to tickets_path, alert: "У вас нету доступа к просмотру содержимого этой страницы" } } unless ["QA","admin"].include? current_user.role
  end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:name, :description, :link)
    end
end
