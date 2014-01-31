require_relative "helper"

test "get specific timezone" do
  timezone = Timezone.new("PHT")

  assert_equal timezone.code, "PHT"
  assert_equal timezone.name, "Philippine Time"
  assert_equal timezone.offset, 28800
end
