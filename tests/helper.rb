require "cutest"
require "cuba/test"

require_relative "../app"

class Time
  class << self
    attr :time_frozen

    def freeze!
      @time_frozen = now
      return true
    end

    def unfreeze!
      @time_frozen = nil
      return true
    end

    def frozen?
      @time_frozen.nil?
    end

    def self.new(*args)
      if Time.frozen?
        return time_frozen
      else
        return super(*args)
      end
    end
  end
end
