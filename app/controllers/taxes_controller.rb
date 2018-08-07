class TaxesController < ApplicationController
  before_action :set_tax, only: [:show, :edit, :update, :destroy]

  def index
    @taxes = Tax.all.order(:date)
  end

  def show
  end

  # def update
  #   respond_to do |format|
  #     if @tax.update(tax_params)
  #       format.html { redirect_to @tax, notice: 'Tax was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @tax }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @tax.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax
      @tax = Tax.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def tax_params
    #   params.require(:tax).permit(:date, :name, :rate)
    # end
end
