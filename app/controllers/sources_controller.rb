class SourcesController < ApplicationController

  def index
     @files = Source.all
  end

end
