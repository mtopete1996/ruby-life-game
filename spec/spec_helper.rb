# frozen_string_literal: true

require 'byebug'
require 'rspec'
require 'simplecov'
require 'zeitwerk'

# Initialize Zeitwerk
# Which will autoload all files in the app directory
loader = Zeitwerk::Loader.new
loader.push_dir('app')
loader.setup

# Initialize SimpleCov
# This will generate a coverage report in the coverage directory
SimpleCov.start
