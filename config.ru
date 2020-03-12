# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
if defined?(Unicorn)
  require 'unicorn/worker_killer'
  use Unicorn::WorkerKiller::MaxRequests, 100, 120, true
end

run Rails.application