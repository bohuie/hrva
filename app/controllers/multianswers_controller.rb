class MultianswersController < ApplicationController
  # GET /multianswers
  # GET /multianswers.json
  def index
    @multianswers = Multianswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @multianswers }
    end
  end

  # GET /multianswers/1
  # GET /multianswers/1.json
  def show
    @multianswer = Multianswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @multianswer }
    end
  end

  # GET /multianswers/new
  # GET /multianswers/new.json
  def new
    @multianswer = Multianswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @multianswer }
    end
  end

  # GET /multianswers/1/edit
  def edit
    @multianswer = Multianswer.find(params[:id])
  end

  # POST /multianswers
  # POST /multianswers.json
  def create
    @multianswer = Multianswer.new(params[:multianswer])

    respond_to do |format|
      if @multianswer.save
        format.html { redirect_to @multianswer, notice: 'Multianswer was successfully created.' }
        format.json { render json: @multianswer, status: :created, location: @multianswer }
      else
        format.html { render action: "new" }
        format.json { render json: @multianswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /multianswers/1
  # PUT /multianswers/1.json
  def update
    @multianswer = Multianswer.find(params[:id])

    respond_to do |format|
      if @multianswer.update_attributes(params[:multianswer])
        format.html { redirect_to @multianswer, notice: 'Multianswer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @multianswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multianswers/1
  # DELETE /multianswers/1.json
  def destroy
    @multianswer = Multianswer.find(params[:id])
    @multianswer.destroy

    respond_to do |format|
      format.html { redirect_to multianswers_url }
      format.json { head :no_content }
    end
  end
end
