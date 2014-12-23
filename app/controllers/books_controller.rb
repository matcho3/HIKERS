class BooksController < ApplicationController
  before_action :set_book, only: [ :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    raise 'hi'
    @trip = Trip.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  def approve
    @book = Book.find(params[:id])
    @book.status = 1
    @book.save

    @notification = Notification.new
    @notification.user_id = @book.user_id
    @notification.body = "#{current_user.name} さんがあなたの申請を承認しました。"
    @notification.save 
  end


  def disapprove
    @book = Book.find(params[:id])
    @book.status = 2
    @book.save

    @notification = Notification.new
    @notification.user_id = @book.user_id
    @notification.body = "#{current_user.name} さんがあなたの申請を却下しました。"
    @notification.save
  end
  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:trip_id, :user_id, :reservations, :status)
    end
end
