require_relative "helper"

scope do
  test "convert time from one timezone to another" do
    get "api?date=2014-01-04&time=1200&from=PH&to=CA"
  end
end
