# frozen_string_literal: true


require "rack-mini-profiler"

# initialization is skipped so trigger it
Rack::MiniProfilerRails.initialize!(Rails.application)
Rack::MiniProfiler.config.authorization_mode = :allow_all
