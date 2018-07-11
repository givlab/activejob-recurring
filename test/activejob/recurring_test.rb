require "test_helper"
require "activejob/recurring/scheduler"

class Activejob::Recurring::Test < ActiveSupport::TestCase
  test "mixin is mixed in" do
    assert_respond_to TestJob, :repeat
  end

  test "schedules the correct number of jobs" do
    scheduler = Activejob::Recurring::Scheduler.new
    scheduler.pause
    scheduler.load_jobs
    assert_equal scheduler.jobs(:all).size, 2
  end

  test "schedules correctly the cron job" do
    scheduler = Activejob::Recurring::Scheduler.new
    scheduler.pause
    scheduler.load_jobs
    job = scheduler.cron_jobs.first
    assert job
  end

  test "schedules correctly the every job" do
    scheduler = Activejob::Recurring::Scheduler.new
    scheduler.pause
    scheduler.load_jobs
    job = scheduler.every_jobs.first
    assert job
    assert_equal job.frequency, 300
  end

  test "adds rake tasks" do
    Rails.application.load_tasks
    assert Rake::Task["activejob:recurring:scheduler"]
  end
end
