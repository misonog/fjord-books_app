# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = reports(:alice)
    user = users(:alice)
    assert report.editable?(user)
  end

  test 'created_on' do
    report = reports(:alice)
    travel_to Time.zone.local(2021, 9, 23)
    assert_equal Date.current, report.created_on
  end
end
