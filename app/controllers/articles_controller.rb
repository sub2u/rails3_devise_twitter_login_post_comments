class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  before_filter :authenticate_user!, :except => :index
  def index
    @articles = Article.find(:all, :order => 'created_at DESC')
    @article = Article.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.user_id=current_user.id
    respond_to do |format|
      if @article.save
  Twitter.configure do |config|
      config.consumer_key = TWITTER_APP_KEY
      config.consumer_secret = TWITTER_SECRET_KEY
      config.oauth_token = session[:twitter_token]
      config.oauth_token_secret = session[:twitter_secret]
    end
begin
client = Twitter::Client.new
client.update(@article.title)
rescue
end
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end


end
