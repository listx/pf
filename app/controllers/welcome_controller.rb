class WelcomeController < ApplicationController
  include JournalHelper
  def index
    @journal_special = Journal.find_by(name: "*pf-landing-page*")
    @journal_special_render = gen_render(@journal_special.natree)
    @jtotal = Journal.all.size
    @journals = Journal.where(\
      user_id: User.find_by(name: "root").id, published: true)\
        .zip(0..(@jtotal - 1))
  end
end
