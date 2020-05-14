require "execution_time/railtie"

module ExecutionTime
  class AppMetrics
    @@counter = 0

    cattr_reader :counter

    def self.reset
      @@counter = 0
    end

    def call(event_name, started, finished, event_id, payload)
      @@counter += 1
    end
  # def red; colorize(self, "\e[1m\e[31m"); end
  # def green; colorize(self, "\e[1m\e[32m"); end
  # def dark_green; colorize(self, "\e[32m"); end
  # def yellow; colorize(self, "\e[1m\e[33m"); end
  # def blue; colorize(self, "\e[1m\e[34m"); end
  # def dark_blue; colorize(self, "\e[34m"); end
    # def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
    def AppMetrics.with_color(text)
      "\e[1m\e[32m[METRICS]\e[0m  \e[32m#{text}\e[0m"
    end
  end

  ActiveSupport::Notifications.subscribe(
    "sql.active_record",
    ExecutionTime::AppMetrics.new
  )

  class Measurer
    def Measurer.watch
      AppMetrics.reset

      start     = Time.now
      before    = GC.stat(:total_allocated_objects)
      ActiveRecord::LogSubscriber.reset_runtime

      result   = yield

      after    = GC.stat(:total_allocated_objects)
      duration = (Time.now - start)
      db_after = ActiveRecord::LogSubscriber.reset_runtime

      info = "Completed in #{(duration * 1000).round(1)}ms | Allocations: #{after - before}"

      if AppMetrics.counter > 0
        info << " | ActiveRecord: #{db_after.round(1)}ms"
        info << " (queries: #{AppMetrics.counter})"
      end

      puts AppMetrics.with_color(info)
      result
    end
  end

  module IrbContextExt
    def evaluate(*args)
      Measurer.watch do
        super(*args)
      end
    end
  end

  module BindingExt
    def eval(*args)
      if args == ['self'] || args == ['']
        super(*args)
      else
        Measurer.watch do
          super(*args)
        end
      end
    end
  end

  module PryExt
    def evaluate_ruby(code)
      current_binding.class.send :prepend, BindingExt
      super(code)
    end
  end
end