require "cuba"
require "json"

require_relative "helpers"

require_relative "query"

Cuba.plugin Helpers

Cuba.define do
  on "api" do
    require "pry"; binding.pry
  end
end
