# frozen_string_literal: true

require 'byebug'
require 'zeitwerk'
require 'rspec'

loader = Zeitwerk::Loader.new
loader.push_dir('app')
loader.setup
