# frozen_string_literal: true

# Candidates controller
class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show edit update destroy]
  def index
    @candidates = Candidate.all
  end

  def show; end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:error] = nil
      redirect_to candidate_path(@candidate)
    else
      flash[:error] = 'Mauvaises données'
      render :new
    end
  end

  def edit; end

  def update
    @candidate.update(candidate_params)
    redirect_to candidate_path(@candidate)
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path
  end

  private

  def candidate_params
    params.require(:candidate).permit(
      :name,
      :photo,
      :popularity_points,
      :attack_strength
    )
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
