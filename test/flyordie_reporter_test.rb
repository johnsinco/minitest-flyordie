require 'minitest'
require 'minitest/autorun'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/flyordie'

describe Minitest::FlyOrDieReporter do
  it "fails if more than the default are slow" do
    output = `ruby -Ilib:test test/_flyordie_reporter_test.rb --maxslow 2 2>&1`
    output.must_match 'test_0001_is slow'
  end
  it "succeeds if no tests are slow" do
    output = `ruby -Ilib:test test/_flyordie_reporter_test.rb --maxslow 2 --slowtime 100 2>&1`
    output.wont_match 'test_0001_is slow'
  end
  it "succeeds if less than the max are slow" do
    output = `ruby -Ilib:test test/_flyordie_reporter_test.rb --maxslow 6 2>&1`
    output.wont_match 'test_0001_is slow'
  end
end
