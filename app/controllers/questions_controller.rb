class QuestionsController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to @quiz, notice: "Question added."
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:position, :body, :available_marks)
  end
end
