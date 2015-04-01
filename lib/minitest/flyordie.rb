require 'minitest'

module Minitest

  def self.plugin_flyordie_options(opts, options)
    opts.on "--maxslow COUNT", Integer, "Maximum number of allowable slow tests before build failed." do |c|
      options[:maxslow] = c
    end
    opts.on "--slowtime DURATION", Integer, "Duration of time before a tests is considered slow, in milliseconds" do |c|
      options[:slowtime] = c
    end
  end

  def self.plugin_flyordie_init(options)
    self.reporter << FlyOrDieReporter.new(options) if options[:maxslow]
  end

  class FlyOrDieReporter < AbstractReporter
    attr_accessor :slowtests, :maxslow, :slowtime

    def initialize(options)
      self.maxslow = options[:maxslow] || 5
      self.slowtime = options[:slowtime] || 50
      self.slowtests = []
    end

    def record(result)
      slowtests << result if (result.time * 1000) > slowtime
    end

    def passed?
      slowtests.length <= maxslow
    end

    def report
      return if passed?
      puts
      puts "#{slowtests.count} tests exceeded the maximum duration of #{slowtime} msec"
      puts
      self.slowtests.each do |st|
        puts "#{sprintf("%7.2f", st.time*1000)} msec -----  #{st.name}"
      end
      puts
    end

  end

end
