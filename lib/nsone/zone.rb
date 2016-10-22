module Nsone
  class Zone
    attr_accessor :raw
    def initialize(options)
      @raw = options
    end

    def records
      @records ||= @raw["records"].map{|r| Nsone::Record.new(r)}
    end

    def to_gdns
      records.map{|r| r.to_gdns}.join
    end

    def method_missing(method_sym, *arguments, &block)
      if @raw && @raw.keys.include?(method_sym.to_s)
        @raw[method_sym.to_s]
      else
        super
      end
    end

    def respond_to?(method_sym, include_private = false)
      if @raw && @raw.keys.include?(method_sym.to_s)
        true
      else
        super
      end
    end
  end
end