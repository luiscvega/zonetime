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
    case
    when @from == "PHT" && @to == "ART" #
      # +8 - -3 == 11; 12:00 pm => 1:00 am
    when @from == "PHT" && @to == "GMT"
      # +8 - 0 == 8; 12:00 pm => 4:00 am

    end

    Time.new(@year, @month, @day, @hour, @minute, @second, "-03:00")
  end

  def timezone
    
  end

  def convert
    {
      "date" => time.strftime("%Y-%m-%d"),
      "time" => time.strftime("%I:%M %p"),
      "timezone" => @to
    }
  end
end
