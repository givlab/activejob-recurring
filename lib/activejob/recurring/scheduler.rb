# frozen_string_literal: true

require "rufus-scheduler"

module Activejob
  module Recurring
    class Scheduler < Rufus::Scheduler
      def load_jobs
        Rails.application.eager_load! unless Rails.application.config.eager_load
        ActiveJob::Base.descendants.each do |klass|
          schedule_recurring_job(klass)
        end
      end

      private
        def schedule_recurring_job(klass)
          schedle_cron_recurring_job(klass)
          schedle_every_recurring_job(klass)
        end

        def schedle_cron_recurring_job(klass)
          recurrence = klass._recurrences[:cron]
          return unless recurrence.present?
          puts "Scheduling #{klass.name} with cron #{recurrence}"
          cron(recurrence) do
            puts "Queueing #{klass}"
            klass.perform_later
          end
        end

        def schedle_every_recurring_job(klass)
          recurrence = klass._recurrences[:every]
          return unless recurrence.present?
          puts "Scheduling #{klass.name} every #{recurrence}"
          every(recurrence) do
            puts "Queueing #{klass}"
            klass.perform_later
          end
        end
    end
  end
end
