class TagsController < ApplicationController
  before_action :find_tag

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def find_tag
      @tag = Tag.find(params[:id])
    end
end
