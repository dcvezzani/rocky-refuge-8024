class StickyNotesController < ApplicationController
  # GET /sticky_notes
  # GET /sticky_notes.json
  def index
    if(params[:filter_missing_referrer_url])
      @sticky_notes = StickyNote.where{referrer_url == nil}
    else
      @sticky_notes = StickyNote.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sticky_notes }
    end
  end

  def index_by_referrer_url
    @referrer_urls = StickyNote.group{[referrer_url, collection_id]}.order{referrer_url}.select{[referrer_url, collection_id]}
    #@sticky_notes = StickyNote.where{referrer_url.in(my{@referrer_urls.map(&:referrer_url)})}.select{[id, referrer_url, note]}.order{referrer_url}

    respond_to do |format|
      #format.html { render 'sticky_notes/index' }
      format.html 
      format.json { render json: @sticky_notes }
    end
  end

  # GET /sticky_notes/1
  # GET /sticky_notes/1.json
  def show
    @sticky_note = StickyNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sticky_note }
    end
  end

  # GET /sticky_notes/new
  # GET /sticky_notes/new.json
  def new
    @sticky_note = StickyNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sticky_note }
    end
  end

  # GET /sticky_notes/1/edit
  def edit
    @sticky_note = StickyNote.find(params[:id])
  end

  # POST /sticky_notes
  # POST /sticky_notes.json
  def create
    @sticky_note = StickyNote.new(params[:sticky_note])

    respond_to do |format|
      if @sticky_note.save
        format.html { redirect_to @sticky_note, notice: 'Sticky note was successfully created.' }
        format.json { render json: @sticky_note, status: :created, location: @sticky_note }
      else
        format.html { render action: "new" }
        format.json { render json: @sticky_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sticky_notes/1
  # PUT /sticky_notes/1.json
  def update
    @sticky_note = StickyNote.find(params[:id])

    respond_to do |format|
      if @sticky_note.update_attributes(params[:sticky_note])
        format.html { redirect_to @sticky_note, notice: 'Sticky note was successfully updated.' }
        format.json { render json: @sticky_note, status: :created, location: @sticky_note }
      else
        format.html { render action: "edit" }
        format.json { render json: @sticky_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sticky_notes/1
  # DELETE /sticky_notes/1.json
  def destroy
    @sticky_note = StickyNote.find(params[:id])
    @sticky_note.destroy

    respond_to do |format|
      format.html { redirect_to sticky_notes_url }
      format.json { head :no_content }
    end
  end
end
