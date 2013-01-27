class TwitterCredentialsController < ApplicationController
  # GET /twitter_credentials
  # GET /twitter_credentials.json
  def index
    @twitter_credentials = TwitterCredential.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitter_credentials }
    end
  end

  # GET /twitter_credentials/1
  # GET /twitter_credentials/1.json
  def show
    @twitter_credential = TwitterCredential.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitter_credential }
    end
  end

  # GET /twitter_credentials/new
  # GET /twitter_credentials/new.json
  def new
    @twitter_credential = TwitterCredential.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @twitter_credential }
    end
  end

  # GET /twitter_credentials/1/edit
  def edit
    @twitter_credential = TwitterCredential.find(params[:id])
  end

  # POST /twitter_credentials
  # POST /twitter_credentials.json
  def create
    @twitter_credential = TwitterCredential.new(params[:twitter_credential])

    respond_to do |format|
      if @twitter_credential.save
        format.html { redirect_to @twitter_credential, notice: 'Twitter credential was successfully created.' }
        format.json { render json: @twitter_credential, status: :created, location: @twitter_credential }
      else
        format.html { render action: "new" }
        format.json { render json: @twitter_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_credentials/1
  # PUT /twitter_credentials/1.json
  def update
    @twitter_credential = TwitterCredential.find(params[:id])

    respond_to do |format|
      if @twitter_credential.update_attributes(params[:twitter_credential])
        format.html { redirect_to @twitter_credential, notice: 'Twitter credential was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitter_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_credentials/1
  # DELETE /twitter_credentials/1.json
  def destroy
    @twitter_credential = TwitterCredential.find(params[:id])
    @twitter_credential.destroy

    respond_to do |format|
      format.html { redirect_to twitter_credentials_url }
      format.json { head :no_content }
    end
  end
end
