require "minitest/autorun"
require "./lib/bank"
require "./lib/team"

class DeepFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    assert_equal ["japan", "US", "India"], Team::COUNTRIES
    assert Team::COUNTRIES.frozen?
    assert Team::COUNTRIES.all? { |country| country.frozen? }
  end

  def test_deep_freeze_to_hash
    assert_equal(
      { "japan" => "yen", "US" => "dollar", "India" => "rupee" },
      Bank::CURRNCIES
    )
    assert Bank::CURRNCIES.frozen?
    assert Bank::CURRNCIES.all? { |key, value| key.frozen? && value.frozen?}
  end
end