require_relative "helper"

scope do
  test "convert time from one timezone to another" do
    get "api?year=2014&month=1&day=1&hour=12&minute=0&second=0&from=PHT&to=ART"

    assert_equal last_response.status, 200
    assert_equal last_response.headers["Content-Type"], "application/json"

    expected = {
      "date" => "2014-01-01",
      "time" => "01:00 AM",
      "timezone" => {
        "code" => "ART",
        "name" => "Argentina Time"
      }
    }

    assert_equal JSON.parse(last_response.body), expected
  end
end
