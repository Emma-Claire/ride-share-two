require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'driver'
require_relative 'rider'
require_relative 'trip'
