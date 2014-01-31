class Timezone
  attr :code, :name, :offset

  def initialize(code)
    @code = code
    @name = self.class.data[code]["name"]
    @offset = self.class.data[code]["offset"]
  end

  def self.data
    file = File.open(File.expand_path("timezones.json"))
    timezones = JSON.parse(file.read)
    file.close

    return timezones
  end
end
