require "cutest"
require "cuba/test"

require_relative "../app"

class << Time
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

  def new(*args)
    if frozen?
      @time_frozen
    else
      super(*args)
    end
  end
  alias_method :now, :new
end
