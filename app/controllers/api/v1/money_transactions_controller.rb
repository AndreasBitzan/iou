# frozen_string_literal: true

class Api::V1::MoneyTransactionsController < Api::V1::BaseController
    before_action :set_money_transaction, only: %i[show edit update destroy]
    # GET /money_transactions.json
    def index
        money_transactions=MoneyTransaction.all
        render json: MoneyTransactionSerializer.new(money_transactions).serialized_json
    end
  
    # GET /money_transactions/1
    # GET /money_transactions/1.json
    def show
    money_transaction=MoneyTransaction.find(params[:id])
    render json: MoneyTransactionSerializer.new(money_transaction).serialized_json
    end
  
    # GET /money_transactions/new
    def new
      @money_transaction = MoneyTransaction.new
    end
  
    # GET /money_transactions/1/edit
    def edit; end
  
    # POST /money_transactions
    # POST /money_transactions.json
    def create
      @money_transaction = MoneyTransaction.new(money_transaction_params)
  
        if @money_transaction.save
            render status: 201, json: MoneyTransactionSerializer.new(@money_transaction).serializable_hash.to_json
        else
            render json: { errors: [{title: "Did not work", detail: "Creating the Transaction did not work"}] }, status: 422
        end
      
    end
  
    # PATCH/PUT /money_transactions/1
    # PATCH/PUT /money_transactions/1.json
    def update
      set_money_transaction

        if @money_transaction.update(money_transaction_params)
            render status: :ok, json: MoneyTransactionSerializer.new(@money_transaction).serializable_hash.to_json
        else
            render json: @money_transaction.errors, status: 422  # einfacher error
            render json: { errors: ErrorSerializer.new(@money_transaction).serialized_json }, status: 422
        end
  
    end
  
    # DELETE /money_transactions/1
    # DELETE /money_transactions/1.json
    def destroy
      set_money_transaction
      begin
        @money_transaction.destroy
      rescue ActiveRecord::RecordNotFound
        render json: { errors: [{title: "Not found", detail: "Did not find the transaction"}] }, status: 404
        return
      rescue ActiveRecord::InvalidForeignKey
        render json: { errors: [{title: "Not found", detail: "Transaction cannot be deleted through various reasons."}] }, status: 403
        return
      rescue StandardError
        raise
      rescue Exception
        raise
      end 
    
      render json: { head: :no_content }, status: 204
    end
  
    private
  
    def set_money_transaction
      @money_transaction = MoneyTransaction.find(params[:id])
    end
  
    def money_transaction_params
        params.require(:data).permit(:type, :creditor_id, :debitor_id, :amount, :paid_at)
    end
  end
  