class Query
  def initialize(atts)
    @year      = atts["year"] || Time.now.year
    @month     = atts["month"] || Time.now.month
    @day       = atts["day"] || Time.now.day
    @hour      = atts["hour"] || Time.now.hour
    @minute    = atts["minute"] || Time.now.min
    @second    = atts["second"] || Time.now.sec
    @from      = atts["from"] || "UTC"
    @to        = atts["to"]
  end

  def time
    @time ||= Time.new(@year, @month, @day, @hour, @minute, @second, from_timezone.offset)
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
    require "pry"; binding.pry
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
