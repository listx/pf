class WelcomeController < ApplicationController
  def index
    jtotal = Journal.all.size
    @journals = Journal.all.zip(0..(jtotal))
  end
end
