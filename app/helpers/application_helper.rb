module ApplicationHelper


  # todo: move to dashboard object / quiz presenter when we have one
  def button_to_toggle_published(quiz)
    new_state = (quiz.published? ? 'Unpublish' : 'Publish')
    button_to(new_state, quiz_path(quiz, quiz: {published: !quiz.published}), method: :patch)
  end

end
