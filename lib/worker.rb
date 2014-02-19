$:.unshift File.expand_path('..', __FILE__)

require 'logger'
require 'sidekiq'

class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    logger.info "Doing hard work with #{name}: #{count}"
  end
end
