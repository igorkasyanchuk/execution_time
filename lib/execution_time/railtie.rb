module ExecutionTime
  class Railtie < ::Rails::Railtie
    console do
      if const_defined?("Pry")
        Pry.send :prepend, ExecutionTime::PryExt
      end
      if const_defined?("IRB::Context")
        IRB::Context.send :prepend, ExecutionTime::IrbContextExt
      end
    end
  end
end
