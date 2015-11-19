class VisitorsController < ApplicationController

  def index
    @prompt = Prompt.where(active: true).first
    if @prompt.prompt_type == "duel" or "multiple_choice"
      @choices = Choice.where(prompt_id: @prompt.id)
    end
  end

end
