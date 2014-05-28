class QuizzesController < ApplicationController

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
    @quiz = current_user.quizzes.find(params[:id])
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :instructions)
  end
end
