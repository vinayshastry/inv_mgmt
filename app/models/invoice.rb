class Invoice < ActiveRecord::Base
  before_save :generate_number

  private
  def generate_number
    self.number = if self.class.all.any?
                    self.class.last.number + 1
                  else
                    IMConfig.invoice_start_number || 0
                  end
  end
end
