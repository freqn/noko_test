class TweetsController < ApplicationController

  def index
    params[:search] = ''if params[:search].blank?
    @client = TwitterClient.client
    get_tweets
  end

  def saved_tweets
    @tweets = Tweet.all.order('id DESC')
  end

  def show
  end

  def get_tweets
    # params[:search] = 'ruby on rails' if params[:search].blank?

    # @tweet_query = params[:search].gsub(/\s/,"%20").downcase
    @tweets = []
    unless params[:search].empty?
      @client.search(params[:search]).take(75).each do |tweet|
          @tweets << "#{tweet.text}"
      end
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
			flash[:notice] = "Tweet saved."
			redirect_to saved_path
		else
			flash.now[:alert] = "Tweet has not been saved."
      redirect_to tweets_path
		end
  end

  private

  def tweet_params
		params.require(:tweet).permit(:title, :content)
	end

end
