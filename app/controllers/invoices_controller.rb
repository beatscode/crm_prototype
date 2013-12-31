class InvoicesController < ApplicationController

  before_filter :authenticate_user 

  def index
  end

  def edit
  end

  def show
    @invoice = Invoice.find(params[:invoice_id])
    @invoice_id = params[:invoice_id]
    @reseller = Reseller.find(params[:reseller_id])
    @details = Invoicedetail.where("invoice_id = ?",params[:invoice_id])
  end

  def create
  end

end
