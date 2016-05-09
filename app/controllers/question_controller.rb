class QuestionController < ApplicationController
  # listagem principal das questoes
  def list
    questions = ::Question.where(level: params[:id])

    render :json => questions.to_json
  end
end
