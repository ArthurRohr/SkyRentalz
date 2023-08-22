class JetsController < ApplicationController
  def index
    @jets = Jet.all
  end
end
