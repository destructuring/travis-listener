$:.unshift File.expand_path('../lib', __FILE__)

require 'travis/listener'

Travis::Listener.setup
Travis::Listener.connect

require 'sidekiq/web'
run Rack::URLMap.new('/' => Travis::Listener::App, '/sidekiq' => Sidekiq::Web)
