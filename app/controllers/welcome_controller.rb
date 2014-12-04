class WelcomeController < ApplicationController
  def index
    @jtotal = Journal.all.size
    @journals = Journal.where(\
      user_id: User.find_by(name: "root").id, published: true)\
        .zip(0..(@jtotal - 1))
  end
end
