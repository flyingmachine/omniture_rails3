require "higml"
require "omniture_rails3/config"
require "omniture_rails3/engine"

module OmnitureRails3
  class << self
    def config
      @config ||= OmnitureRails3::Config.instance
    end
  end
end