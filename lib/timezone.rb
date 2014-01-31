class Timezone
  attr :code, :name, :offset

  File.open(File.expand_path("timezones.json")) do |file|
    DATA = JSON.parse(file.read)
  end

  def initialize(code)
    @code = code
    @name = DATA[code]["name"]
    @offset = DATA[code]["offset"] * 60 # convert to seconds
  end
end
