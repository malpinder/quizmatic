class QuizzesController < ApplicationController

  before_filter :authenticate!

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Your quiz has been created.'
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
    redirect_to new_session_request_path unless @quiz.user == current_user
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :instructions)
  end
end
