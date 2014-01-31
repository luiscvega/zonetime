require_relative "helper"

setup do
  {
    "year"   => "2014",
    "month"  => "1",
    "day"    => "1",
    "hour"   => "12",
    "minute" => "00",
    "second" => "00",
    "from"   => "PHT",
    "to"     => "ART"
  }
end

test "#from_timezone" do |args|
  assert_equal Query.new(args).from_timezone.code, "PHT"
end

test "#to_timezone" do |args|
  assert_equal Query.new(args).to_timezone.code, "ART"
end

test "#time" do |args|
  assert_equal Query.new(args).time, Time.new(2014, 1, 1, 4, 0, 0, 0)
end

test "#from_time" do |args|
  query = Query.new(args)

  assert_equal query.from_time, Time.new(2014, 1, 1, 12, 0, 0, 28800)
end

test "#to_time" do |args|
  query = Query.new(args)

  assert_equal query.to_time, Time.new(2014, 1, 1, 1, 0, 0, -10800)
end

test "convert PHT to ART" do
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
    "timezone" => {
      "code" => "ART",
      "name" => "Argentina Time"
    }
  }

  time = query.convert
  assert_equal time, expected
end

test "convert PHT to GMT" do
  query = Query.new(
    "year"   => "2014",
    "month"  => "1",
    "day"    => "1",
    "hour"   => "12",
    "minute" => "00",
    "second" => "00",
    "from"   => "PHT",
    "to"     => "GMT"
  )

  expected = {
    "date" => "2014-01-01",
    "time" => "04:00 AM",
    "timezone" => {
      "code" => "GMT",
      "name" => "Greenwich Mean Time"
    }
  }

  time = query.convert
  assert_equal time, expected
end
