class SlackResponseController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    puts params

    SlackResponseSaver.new( params ).save

    render nothing: true
  end
end