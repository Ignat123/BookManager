class LarioGameController < ApplicationController

  after_action :allow_iframe, only: :index

  def index
  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
