class LookbooksController < ApplicationController
  before_action :set_lookbook, only: [:show, :edit, :update, :destroy, :new, :index]
  respond_to :html, :xml, :json

  def index

    $global_displayTable = 'false';

    if( !params[:book_id].nil? )
      $global_bookID = params[:book_id]
    end

    puts $global_bookID

    if( !$global_bookID.nil? )
      @book = Book.find( $global_bookID )
      @lookbooks = @book.lookbooks
    end

    if !params[:year].nil? && !params[:event].nil? && !params[:season].nil? && !params[:category].nil? && !params[:stylist_id].nil?

      #All present
    if !params[:year].empty? && !params[:event].empty? && !params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], event: params[:event], season: params[:season], category: params[:category], stylist_id: params[:stylist_id], active: "t")

      #year empty
    elsif params[:year].empty? && !params[:event].empty? && !params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(event: params[:event], season: params[:season], category: params[:category], stylist_id: params[:stylist_id], active: "t")

      #event empty
    elsif !params[:year].empty? && params[:event].empty? && !params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], season: params[:season], category: params[:category], stylist_id: params[:stylist_id], active: "t")

      # season empty
    elsif !params[:year].empty? && !params[:event].empty? && params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
        @lookbooks = @lookbooks.where(year: params[:year], event: params[:event], category: params[:category], stylist_id: params[:stylist_id], active: "t")

      # category empty
    elsif !params[:year].empty? && !params[:event].empty? && !params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
        @lookbooks = @lookbooks.where(year: params[:year], event: params[:event], season: params[:season], stylist_id: params[:stylist_id], active: "t")

      #stylist_id empty
    elsif !params[:year].empty? && !params[:event].empty? && !params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( year: params[:year], event: params[:event], season: params[:season], category: params[:category], active: "t" )

      #year and event
    elsif params[:year].empty? && params[:event].empty? && !params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(season: params[:season], category: params[:category], stylist_id: params[:stylist_id], active: "t")

      #year and season
    elsif params[:year].empty? && !params[:event].empty? && params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(event: params[:event], category: params[:category], stylist_id: params[:stylist_id], active: "t")

      #year and Category
    elsif params[:year].empty? && !params[:event].empty? && !params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( event: params[:event], season: params[:season], stylist_id: params[:stylist_id], active: "t")

    #season and category
    elsif !params[:year].empty? && !params[:event].empty? && params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], event: params[:event], stylist_id: params[:stylist_id], active: "t")

    #season and event
    elsif !params[:year].empty? && params[:event].empty? && params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], category: params[:category], stylist_id: params[:stylist_id], active: "t")

    #Category and event
    elsif !params[:year].empty? && params[:event].empty? && !params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], season: params[:season], stylist_id: params[:stylist_id], active: "t")

      # year, season, category empty
    elsif params[:year].empty? && !params[:event].empty? && params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
        @lookbooks = @lookbooks.where(event: params[:event], stylist_id: params[:stylist_id], active: "t")

        # year, season, event empty
    elsif params[:year].empty? && params[:event].empty? && params[:season].empty? && !params[:category].empty? && !params[:stylist_id].empty?
          @lookbooks = @lookbooks.where(category: params[:category], stylist_id: params[:stylist_id], active: "t")

          # event, season, category empty
    elsif !params[:year].empty? && params[:event].empty? && params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
            @lookbooks = @lookbooks.where(year: params[:year], stylist_id: params[:stylist_id], active: "t")

            # year, event, category empty
    elsif params[:year].empty? && params[:event].empty? && !params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
              @lookbooks = @lookbooks.where(season: params[:season], stylist_id: params[:stylist_id], active: "t")

      #event and Stylist empty
    elsif !params[:year].empty? && params[:event].empty? && !params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], season: params[:season], category: params[:category], active: "t")

      #Category and Stylist empty
    elsif !params[:year].empty? && !params[:event].empty? && !params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], season: params[:season], event: params[:event], active: "t" )

      #Season and Stylist empty
    elsif !params[:year].empty? && !params[:event].empty? && params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(year: params[:year], event: params[:event], category: params[:category], active: "t" )

      #Year and Stylist empty
    elsif params[:year].empty? && !params[:event].empty? && !params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( event: params[:event], category: params[:category], season: params[:season], active: "t" )

      #Category, event, stylist empty
    elsif !params[:year].empty? && params[:event].empty? && !params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( year: params[:year], season: params[:season], active: "t" )

      #Season, event, stylist empty
    elsif !params[:year].empty? && params[:event].empty? && params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( year: params[:year], category: params[:category], active: "t" )

      #Year, event, stylist empty
    elsif params[:year].empty? && params[:event].empty? && !params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( category: params[:category], season: params[:season], active: "t" )

      #Season, Year, stylist empty
    elsif params[:year].empty? && !params[:event].empty? && params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( category: params[:category], event: params[:event], active: "t" )

      #Season, Category, stylist empty
    elsif !params[:year].empty? && !params[:event].empty? && params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( year: params[:year], event: params[:event], active: "t" )

      #Category, Year, stylist empty
    elsif params[:year].empty? && !params[:event].empty? && !params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( season: params[:season], event: params[:event], active: "t" )

      #Year, Season, Event, Stylist empty
    elsif params[:year].empty? && params[:event].empty? && params[:season].empty? && !params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( category: params[:category], active: "t" )

      #Year, Category, Event, Stylist empty
    elsif params[:year].empty? && params[:event].empty? && !params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( season: params[:season], active: "t" )

      #Year, Season, Category, Stylist empty
    elsif params[:year].empty? && !params[:event].empty? && params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( event: params[:event], active: "t" )

      #Season, Category, Event, Stylist empty
    elsif !params[:year].empty? && params[:event].empty? && params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( year: params[:year], active: "t" )

      #Season, Category, Event, year empty
    elsif params[:year].empty? && params[:event].empty? && params[:season].empty? && params[:category].empty? && !params[:stylist_id].empty?
      @lookbooks = @lookbooks.where( stylist_id: params[:stylist_id], active: "t" )

    else
      @lookbooks = @book.lookbooks
    end

    if params[:year].empty? && params[:event].empty? && params[:season].empty? && params[:category].empty? && params[:stylist_id].empty?
      @lookbooks = @lookbooks.where(active: "t")
    end

    else
      @lookbooks = @lookbooks.where(active: "t")
    end


    if( !params[:show_inactive].nil? )
    if( !params[:show_inactive].empty? )

      $global_displayTable = 'true'
      @lookbooks = @book.lookbooks

    end
    end

    respond_with(@lookbook)

  end

  def show
    @book = Book.new
    respond_with(@lookbook)
  end

  def new
    @category = Category.new
    @event = Event.new
    @book = Book.new
    $global_lookbookid = params[:type]
    @lookbook = Lookbook.new()
   # respond_with(@lookbook)
  end

  def edit
    @category = Category.new
    @event = Event.new
    @book = Book.new
    $global_lookbookid = params[:type]
  end

  def create

    @bookid = lookbook_params[:book_id]
    lookbook_params.delete :book_id

    @lookbook = Lookbook.new(lookbook_params)
    @lookbook.save

    @book = Book.find(@bookid)
    @book.lookbooks << @lookbook

    respond_with(@lookbook)
  end

  def update

    @bookid = lookbook_params[:book_id]
    lookbook_params.delete :book_id

    @lookbook.update(lookbook_params)
    respond_with(@lookbook)
  end

  def destroy
    @lookbook.destroy
    respond_with(@lookbook)
  end

  private
    def set_lookbook
      if !params[:id].nil?
        @lookbook = Lookbook.find(params[:id])
      end

    end

    def lookbook_params
      #params.require(:lookbook).permit(:user_id, :season, :category, :event, :description, :look, :year)
      params.require(:lookbook).permit!
    end
end
