class HomeController < ApplicationController

  def index
  end
  def landing
  end
  def launch
    @employees = Employee.all
  end
  def questionaire
    @questions = Question.all
  end
  
end
