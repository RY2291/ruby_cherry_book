require "minitest/autorun"

class SampleTest < Minitest::Test
  def test_smaple
    assert_equal "RUBY", "ruby".capitalize
  end
end