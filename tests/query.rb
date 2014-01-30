require_relative "helper"

test "convert" do
  query = Query.new(
    "year"   => "2014",
    "month"  => "1",
    "day"    => "1",
    "hour"   => "12",
    "minute" => "00",
    "second" => "00",
    "from"   => "PHT",
    "to"     => "ART"
  )

  expected = {
    "date" => "2014-01-01",
    "time" => "01:00 AM",
    "timezone" => "ART"
  }

  time = query.convert
  assert_equal time, expected
end
