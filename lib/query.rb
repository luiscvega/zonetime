class Query
  def initialize(atts)
    @year      = atts["year"]
    @month     = atts["month"]
    @day       = atts["day"]
    @hour      = atts["hour"]
    @minute    = atts["minute"]
    @second    = atts["second"]
    @from      = atts["from"]
    @to        = atts["to"]
  end

  # 12:00 PM PHT
  def from_time
    @from_time ||= Time.new(@year, @month, @day, @hour, @minute, @second, from_timezone.offset)
  end

  # 4:00 AM GMT
  def to_time
    @to_time ||= Time.new(
      @year,
      @month,
      @day,
      @hour.to_i - ((from_timezone.offset / 60 / 60) - (to_timezone.offset / 60 / 60)),
      @minute,
      @second,
      to_timezone.offset
    )
  end

  def from_timezone
    @from_timezone ||= Timezone.new(@from)
  end

  def to_timezone
    @to_timezone ||= Timezone.new(@to)
  end

  def convert
    {
      "date" => to_time.strftime("%Y-%m-%d"),
      "time" => to_time.strftime("%I:%M %p"),
      "timezone" => {
        "code" => to_timezone.code,
        "name" => to_timezone.name
      }
    }
  end
end
