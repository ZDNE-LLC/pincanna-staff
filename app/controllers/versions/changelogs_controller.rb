class Versions::ChangelogsController < ApplicationController
  def show
    @object = params[:class_name].constantize.find params[:id]
    @versions = @object.versions
  end
end
