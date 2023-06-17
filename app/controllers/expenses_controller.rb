class ExpensesController < ApplicationController
  # GET /expenses/new
  def new
    @expense = Expense.new
    @categories = Category.all
    @category = Category.find(params[:category_id])
  end

  # POST /expenses or /expenses.json
  def create
    @expense = current_user.expenses.new(expense_params)
    @expense.author_id = current_user.id

    respond_to do |format|
      if @expense.save
        category = Category.find(params[:expense][:category_id])
        @expense.categories << category

        format.html { redirect_to category_path(id: params[:category_id]) }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @category = Category.find(params[:category_id])
  #   @expense = @category.expenses.find(params[:expense_id])
  #   @expense.destroy
  #   redirect_to category_path(@category), notice: "Expense successfully deleted."
  # end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category)
  end
end
