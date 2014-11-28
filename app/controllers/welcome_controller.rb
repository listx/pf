class WelcomeController < ApplicationController
  def index
    @journals = Journal.all
  end
end
