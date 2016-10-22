require "httparty"

module Nsone
  class Client
    include HTTParty
    base_uri 'https://api.nsone.net/v1/'

    def initialize(api_key)
      self.class.default_options[:headers] = {'X-NSONE-Key' => api_key}
    end

    def zones
      self.class.get('/zones').map{|z| Nsone::Zone.new(z)}
    end

    def zone(name)
      Nsone::Zone.new(self.class.get("/zones/#{name}"))
    end
  end
end