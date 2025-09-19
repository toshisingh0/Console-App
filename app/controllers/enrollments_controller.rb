class EnrollmentsController < ApplicationController
   # before_action :set_student



   def index
    if params[:student_id]
      @student = Student.find(params[:student_id])
      @enrollments = @student.enrollments.includes(:course)  # important!
    else
      @enrollments = Enrollment.includes(:student, :course).all
    end
  end

   def new
    @enrollment = Enrollment.new
    @courses = Course.all
    @students = Student.all  # courses student is not already enrolled in
  end

  def create
    @course = Course.find(params[:enrollment][:course_id])
    @enrollment = Enrollment.new(student: @student, course: @course)

    if @enrollment.save
      redirect_to student_enrollments_path(@student), notice: "Student enrolled successfully!"
    else
      @courses = Course.all
      @students = Student.all
      flash.now[:alert] = @enrollment.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end
end
