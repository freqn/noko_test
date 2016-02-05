class TweetsController < ApplicationController

  def index
    params[:search] = ''if params[:search].blank?
    @client = TwitterClient.client
    get_tweets
  end

  def show
    @tweets = Tweet.all
  end

  def get_tweets
    # params[:search] = 'ruby on rails' if params[:search].blank?

    # @tweet_query = params[:search].gsub(/\s/,"%20").downcase
    @tweets = []
    unless params[:search].empty?
      @client.search(params[:search]).take(75).each do |tweet|
          @tweets << tweet.text
      end
    end
  end

  private

  # def tweet_params
	# 	params.require(:tweet).permit(:title, :content)
	# end

end
