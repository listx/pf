class JournalsController < ApplicationController
  # We need to include the TextHelper class because we can use the
  # 'simple_helper' method from within 'JournalHelper'...?
  include ActionView::Helpers::TextHelper
  include JournalHelper

  before_action :set_journal, only: [:show, :edit, :update, :destroy, :exhibit]
  before_action :logged_in_user, except: [:exhibit]

  # GET /journals
  # GET /journals.json
  def index
    @journals = Journal.all
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
  end

  # GET /journals/1/exhibit
  def exhibit
    @render = gen_render(@journal.natree)
  end

  # GET /journals/new
  def new
    @journal = Journal.new\
      published: true
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params.merge!\
      user_id: current_user.id
    )

    respond_to do |format|
      if @journal.save
        set_mount_type(@journal, :avatar)
        format.html { redirect_to @journal,\
          notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors,\
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        set_mount_type(@journal, :avatar, params["journal"])
        format.html { redirect_to @journal,\
          notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors,\
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to journals_url,\
        notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list
    # through.
    def journal_params
      params.require(:journal).permit(\
        :name,\
        :user_id,\
        :avatar, :remove_avatar, :avatar_cache, :avatar_type,\
        :natree,\
        # we don't include 'rendered', because that parameter is READ-only from the DB
        :published,\
        :priority)
    end
end
