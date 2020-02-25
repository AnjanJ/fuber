# frozen_string_literal: true

require 'test_helper'

class CabTest < ActiveSupport::TestCase
  test 'should return true if color is pink' do
    cab = cabs(:one)
    assert cab.pink?
  end
end
