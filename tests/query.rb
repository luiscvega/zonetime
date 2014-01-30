require_relative "helper"

test "convert" do
  query = Query.new(
    "date" => "2014-01-01",
    "time" => "1200",
    "from" => "PHT",
    "to" => "ART"
  )

  time = query.convert
  assert_equal time, "2014-01-01 01:00 AM (ART)"
end
