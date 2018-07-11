# frozen_string_literal: true

module Activejob
  module Recurring
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "tasks/activejob/recurring_tasks.rake"
      end
    end
  end
end
