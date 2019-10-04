class TestsController < ApplicationController
  def index
    @test = Test.new
  end

  def new
    render partial: "users/login-page"
  end

  def create
    @test = Test.create(test_params)
    redirect_to root_path
  end

  private
  def test_params
    params.require(:test).permit(:image)
  end
end
