# frozen_string_literal: true

class TestJob < ApplicationJob
  repeat every: "5m",
         cron: "0 3 * * * America/New_York"
end
