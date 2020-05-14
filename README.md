# ExecutionTime

Monitor execution time and other metricts directly in `rails console`, similar to what you see after each request.

`[METRICS]  Completed in 908.3ms | Allocations: 2894 | ActiveRecord: 0.9ms (queries: 13)`

 <img src="https://github.com/igorkasyanchuk/execution_time/blob/master/docs/execution_time_new.gif?raw=true" width="90%" />

## Usage

Just add this gem to the Gemfile and start `rails c`. After this try to do something like `User.first`.

If you want to measure few lines of code just wrap it with `begin/end`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'execution_time'
```

## First run

Sometime you can see that there are more SQL queries or allocated objects because Ruby just loading objects in memory or verifying connection to the DB.

## Contributing

You are welcome to contribute.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
