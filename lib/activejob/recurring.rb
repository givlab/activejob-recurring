# frozen_string_literal: true

require "activejob/recurring/railtie"

module Activejob
  module Recurring
    extend ActiveSupport::Autoload

    autoload :Mixin

    def self.start_scheduler
      require "activejob/recurring/scheduler"
      scheduler = Scheduler.new
      scheduler.load_jobs
      scheduler.join
    end
  end
end

ActiveJob::Base.send :include, Activejob::Recurring::Mixin
