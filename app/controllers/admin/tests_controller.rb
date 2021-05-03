class Admin::TestsController < Admin::BaseController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :set_test, only: %i[show destroy edit update start]

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
    @test.author_id = current_user.id

    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  def edit
 
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def update

    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
