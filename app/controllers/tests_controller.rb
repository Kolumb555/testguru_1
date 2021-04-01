class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :set_test, only: %i[show destroy edit update start]
  #before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def edit
 
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def update

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def set_test
    @test = Test.find(params[:id])
  end

  # def set_user
  #   @user = current_user
  # end

end
