class IMConfig
  configs = [:invoice_start_number]
  @@values = {}
  configs.each do |config|
    send :define_singleton_method, config do
      @@values[config] = ENV[config.to_s.upcase] if @@values[config].nil?
      @@values[config]
    end

    send :define_singleton_method, "with_#{config.to_s}_overridden_to" do |overridden_value, &block|
      old_val = @@values[config]
      @@values[config] = overridden_value
      begin
        block.call
      ensure
        @@values[config] = old_val
      end
    end
  end
end
