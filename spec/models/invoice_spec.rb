require 'spec_helper'

describe Invoice do
  describe "generates number" do
    it "uses config" do
      IMConfig.with_invoice_start_number_overridden_to(2000) do
        inv = Invoice.new
        inv.save!
        inv.number.should == 2000
      end
    end

    it "uses next number from existing one" do
      IMConfig.with_invoice_start_number_overridden_to(2000) do
        Invoice.new.save!
        inv = Invoice.new
        inv.save!
        inv.number.should == 2001
      end
    end
  end
end
