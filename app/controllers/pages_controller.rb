class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:prompt]
      service = OpenaiService.new(params[:prompt])
      @response = service.call
    end
  end
end
