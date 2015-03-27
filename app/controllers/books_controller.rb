class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index

    if !params[:id].nil?
      $global_currentClientSearchID = params[:id]
    end

    @books = Book.all

    respond_with(@books)
  end

  def show
    #respond_with(@book)
    redirect_to :back
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to :back
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      #params.require(:book).permit(:name)
      params.require(:book).permit!
    end
end
