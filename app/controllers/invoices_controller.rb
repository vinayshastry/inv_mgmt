class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def create
    Invoice.new.save!
    redirect_to :controller => 'invoices'
  end
end
