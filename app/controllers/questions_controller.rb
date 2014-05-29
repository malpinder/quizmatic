class QuestionsController < ApplicationController

  before_filter :authenticate!

  def new
    redirect_to new_session_request_path and return unless quiz.user == current_user
    @question = quiz.questions.build
  end

  def create
    redirect_to new_session_request_path and return unless quiz.user == current_user
    @question = quiz.questions.build(question_params)
    if @question.save!
      redirect_to @quiz, notice: "Question added."
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:position, :body, :available_marks)
  end

  def quiz
    @quiz ||= Quiz.find(params[:quiz_id])
  end
  helper_method :quiz
end
