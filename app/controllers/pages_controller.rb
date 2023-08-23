class PagesController < ApplicationController
  def home
    @jets = Jet.all
  end
end
