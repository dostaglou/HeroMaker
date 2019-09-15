class DiceController < ApplicationController
  def index
    @sides = params[:sides].present? ? params[:sides] : 1
    @number = params[:number].present? ? params[:number] : 1
    @adjustment = params[:adjustment].present? ? params[:adjustment] : 0
  end
end
