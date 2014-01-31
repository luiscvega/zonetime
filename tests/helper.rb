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
    !!@time_frozen
  end

  def new(*args)
    return super(*args) unless frozen?

    @time_frozen
  end
  alias_method :now, :new
end
