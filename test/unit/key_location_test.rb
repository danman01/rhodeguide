require 'test_helper'

class KeyLocationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert KeyLocation.new.valid?
  end
end
