class User < ApplicationRecord

  def User.complex_logic
    User.first
    User.where(email: 'gem@site.com').to_a
    User.all.to_a
    x = 0
    10.times do |e|
      x += e
      y = e
      a = []
      a += [e]
      User.where(id: e).any?
    end
    sleep(rand(10) / 10.0)
    nil
  end

end
