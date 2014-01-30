class Query
  def initialize(atts)
    @year   = atts["year"]
    @month  = atts["month"]
    @day    = atts["day"]
    @hour   = atts["hour"]
    @minute = atts["minute"]
    @second = atts["second"]
    @from   = atts["from"]
    @to     = atts["to"]
  end

  def time
    Time.new(@year, @month, @day, @hour.to_i - 11, @minute, @second, "-03:00")
  end

  def convert
    {
      "date" => time.strftime("%Y-%m-%d"),
      "time" => time.strftime("%I:%M %p"),
      "timezone" => @to
    }
  end
end
