module ApplicationHelper
	def answer_status(status)
    return "<span class=\"label label-success\">CORRECT</span>".html_safe if status == true
    return "<span class=\"label label-danger\">INCORRECT</span>".html_safe if status != true
  end
end
