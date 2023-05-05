class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy ]

  # GET /invoices
  #GET /invoices.json
  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html
      format.csv { send_data @invoices.to_csv, filename: "invoices-#{Date.today}.csv" }
    end
    
  end

  def search
    index
    render :index
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

 # GET /invoices/1/edit
 def edit
 end
   
  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

    # PATCH/PUT /invoices/1 or /invoices/1.json
    def update
      respond_to do |format|
        if @invoice.update(invoice_params)
          format.html { redirect_to @invoice, notice: "Invoice was successfully updated." }
          format.json { render :show, status: :ok, location: @invoice }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @invoice.errors, status: :unprocessable_entity }
        end
      end
    end
      
  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:amount, :company, :contragent, :currency, :date)
    end
end