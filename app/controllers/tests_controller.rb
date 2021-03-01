class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  def index
    
  end

  def show
   
  end

  def new

  end

  def create

  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
