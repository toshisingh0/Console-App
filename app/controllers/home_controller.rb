class HomeController < ApplicationController
  def index
    @student = Student.first   # या koi bhi student
    @course = Course.first
  end
end
