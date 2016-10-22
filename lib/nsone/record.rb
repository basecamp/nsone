require 'yaml'

module Nsone
  class Record
    attr_accessor :raw
    def initialize(options)
      @raw = options
    end

    def answers
      # Munge the default short_answers, as Google expects a . at the end of text domains here.
      short_answers.map{|s|
        (s =~ /[A-Za-z]/ && ! s.end_with?('.')) ? "#{s}." : s
      }
    end

    def to_gdns
      #---
      #kind: dns#resourceRecordSet
      #name: workrev.com.
      #rrdatas:
      #- 72.32.62.114
      #ttl: 300
      #type: A
      {
        'kind' => "dns#resourceRecordSet",
        'name' => "#{self.domain}.",
        'rrdatas' => self.answers,
        'ttl' => self.ttl,
        'type' => self.type
      }.to_yaml
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