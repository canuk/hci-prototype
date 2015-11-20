module ApplicationHelper

  def prompt_type_label(x)
    if x == "open_ended"
      return "success"
    elsif x == "multiple_choice"
      return "primary"
    elsif x == "duel"
      return "info"
    else
      return "default"
    end
  end


end
