require 'spec_helper'

describe InvoicesController do
  around(:each) do |example|
    IMConfig.with_invoice_start_number_overridden_to(2000) do
      example.run
    end
  end

  describe "index" do
    it "shows all invoices" do
      inv1 = Invoice.new
      inv2 = Invoice.new
      inv1.save!
      inv2.save!

      get :index
      expect(assigns(:invoices).to_a).to eq([inv1, inv2])
    end
  end

  describe "add" do
    it "adds a new invoice" do
      post :create
      Invoice.all.size.should be(1)
      response.should redirect_to("/invoices")
    end
  end
end
