# ExecutionTime

[!["Buy Me A Coffee"](https://github.com/igorkasyanchuk/get-smart/blob/main/docs/snapshot-bmc-button-small.png?raw=true)](https://buymeacoffee.com/igorkasyanchuk)

Monitor execution time and other metrics directly in `rails console`, similar to what you see after each request.

`[METRICS]  Completed in 908.3ms | Allocations: 2894 | ActiveRecord: 0.9ms (queries: 13)`

 <img src="https://github.com/igorkasyanchuk/execution_time/blob/master/docs/execution_time_new.gif?raw=true" width="90%" />

## Usage

Just add this gem to the Gemfile and start `rails c`. After this try to do something like `User.first`.

If you want to measure few lines of code just wrap it with `begin/end`:

```ruby
[4] pry(main)> begin
[4] pry(main)*   User.first.first_name.size
[4] pry(main)*   a = User.count + 1
[4] pry(main)*   b = User.second.last_name.size
[4] pry(main)* end
  User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
   (3.6ms)  SELECT COUNT(*) FROM "users"
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 1]]
[METRICS]  Completed in 6.8ms | Allocations: 839 | ActiveRecord: 4.3ms (queries: 3)
=> 5
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'execution_time'
```

or

```ruby
gem "irb"
gem "execution_time"

# sometimes IRB is loaded after execution_time gem, so we need to load it first
```

## First run

Sometime you can see that there are more SQL queries or allocated objects because Ruby is just loading objects in memory or verifying connection to the DB.

## How to disable/enable metrics output in the console

If you need to disable gem in the console you can do it by `ExecutionTime.disable!`. And later enable with `ExecutionTime.enable!`.

By default gem is enabled.


## Contributing

You are welcome to contribute.

## Contributos

- https://github.com/nbulaj
- https://github.com/ruban-thilak

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[<img src="https://github.com/igorkasyanchuk/rails_time_travel/blob/main/docs/more_gems.png?raw=true"
/>](https://www.railsjazz.com/?utm_source=github&utm_medium=bottom&utm_campaign=execution_time)

[!["Buy Me A Coffee"](https://github.com/igorkasyanchuk/get-smart/blob/main/docs/snapshot-bmc-button.png?raw=true)](https://buymeacoffee.com/igorkasyanchuk)
