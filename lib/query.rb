class Query
  attr :year, :month, :day, :hour, :minute, :second, :to, :from

  def initialize(atts)
    @year      = atts["year"]   || Time.now.utc.year
    @month     = atts["month"]  || Time.now.utc.month
    @day       = atts["day"]    || Time.now.utc.day
    @hour      = atts["hour"]   || Time.now.utc.hour
    @minute    = atts["minute"] || Time.now.utc.min
    @second    = atts["second"] || Time.now.utc.sec
    @from      = atts["from"]   || "UTC"
    @to        = atts["to"]
  end

  def time
    @time ||= Time.new(year, month, day, hour, minute, second, from_timezone.offset).utc
  end

  def to_time
    @to_time ||= time.getlocal(to_timezone.offset)
  end

  def from_time
    @from_time ||= time.getlocal(from_timezone.offset)
  end

  def from_timezone
    @from_timezone ||= Timezone[@from]
  end

  def to_timezone
    @to_timezone ||= Timezone[@to]
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
