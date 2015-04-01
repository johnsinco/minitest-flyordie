# Minitest::FlyOrDie

FlyOrDie is a simple plugin for Minitest that allows you to specify via command-line options a maximum duration for a test to be marked as "slow", and a maximum number of allowable slow tests.  
If the thresholds are exceeded, the test run will be marked as failed and the list of slow tests will be output.
FlyOrDie is primarily meant to be used as part of a Continuous Integration (CI) process to ensure test quality, sometimes referred to as a 'test ratchet'.

## Installation

Add this line to your application's Gemfile:

gem "minitest-flyordie"

```ruby
gem 'minitest-flyordie'
```

And then execute:

    $ bundle


## Usage

Use the `--maxslow=COUNT` flag to set the maximum allowed number of slow tests
Use the `--slowtime=DURATION` flag to specify the duration for a tests to be slow, in milliseconds

Direct invocation:

    `ruby test_thing.rb --maxslow=3 --slowtime=30`

Via rake test runner:

    `TESTOPTS='--maxslow=4 --slowtime=42' rake test`

## Credits

Based on ideas from [Step](https://github.com/stephenaument) and [Nick](https://github.com/nmeans). And code liberally copied from Nick's [minitest-profile](https://github.com/nmeans/minitest-profile) gem.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/minitest-flyordie/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
