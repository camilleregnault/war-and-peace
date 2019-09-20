class FightsController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
  end

  def create 
    redirect_to fights_show_path
  end
end
