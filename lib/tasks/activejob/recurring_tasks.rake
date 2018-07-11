# frozen_string_literal: true

namespace :activejob do
  namespace :recurring do
    desc "Start recurring job scheduler"
    task scheduler: :environment do
      Activejob::Recurring.start_scheduler
    end
  end
end
