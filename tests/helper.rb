require "cutest"
require "cuba/test"

require_relative "../app"

class Time
  def initialize(*args)
    if self.class.frozen?
      return self.class.time_frozen
    else
      return super(*args)
    end
  end

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
  end
end
