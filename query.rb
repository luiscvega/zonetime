class Query
  def initialize(atts)
    @date = atts["date"]
    @time = atts["time"]
    @from = atts["from"]
    @to   = atts["to"]
  end

  def convert
    Time.parse("#{@date} 1:00 #{@from}").strftime("%Y-%m-%d %I:%M %p (ART)")
  end
end
