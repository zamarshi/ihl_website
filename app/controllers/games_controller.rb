class GamesController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new params.require(:game).permit([:date,
                                      :body,
                                      :tweet_this,
                                      :image,
                                      tag_ids: []])
    @question.user = current_user
    if @question.save
      if @question.tweet_this
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
          config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
          config.access_token        = current_user.oauth_token
          config.access_token_secret = current_user.oauth_secret
        end
        client.update @question.title
      end

      # redirect_to question_path({id: @question.id})
      # redirect_to question_path({id: @question})

      # flash works very similar to the session in a sense that it uses cookies
      # to store values that persist through redirect_to or render
      # flash will clear the value as soon as it's read so it doesn't persist
      # through the rest of the requests
      flash[:notice] = 'Question Created!'
      redirect_to question_path(@question)
    else
      # if we juse use flash[:alert] in here then the flash message will persist
      # to the next request as well. flash.now[:alert] will make it only show
      # when you render the `:new` template but it won't persist to the next
      # request
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

end
