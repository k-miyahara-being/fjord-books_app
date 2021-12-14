# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable' do
    my_report = reports(:alice)
    user01 = users(:alice)
    user02 = users(:bob)

    assert my_report.editable?(user01)
    assert_not my_report.editable?(user02)
  end

  test '#created_on' do
    my_report = reports(:alice)

    assert_equal Date.current, my_report.created_on
  end
end
