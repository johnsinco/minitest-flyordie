require 'minitest'
require 'minitest/autorun'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/flyordie'

describe "slow runs" do
  5.times do
    it "is slow" do
      sleep(90/1000.0)
      assert true
    end
  end
end
