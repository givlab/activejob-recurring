
# ActiveJob Recurring
Run jobs recurring. This gem uses [Rufus Scheduler](https://github.com/jmettraux/rufus-scheduler) to run recurring jobs.

It will schedule the recurrence with rufus and when the job needs to be run it will be enqueued to your ActiveJob queueing system with `.perform_later`. That means that depending on your queueing system load it might not be executed immediatly.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activejob-recurring'
```

And then execute:
```bash
$ bundle
```

## Usage
Use the `repeat` method to define a job's recurrence

```ruby
class YourFirstJob < ApplicationJob
  repeat cron: "0 3 * * * America/New_York"
  #...
end

class YourSecondJob < ApplicationJob
  repeat every: "5m"
  #...
end
```

And then execute:
```bash
$ rails activejob:recurring:scheduler
```

Note: There's no locking system in place so you need to make sure you don't run multiple instances on `activejob:recurring:scheduler`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/givlab/activejob-recurring.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
