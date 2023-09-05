class InvoicesController < ApplicationController
  def index
    # TODO: pagination
    render json: InvoiceSerializer.new(invoices).serializable_hash
  end

  def create
    result = BalanceChanger.new(user).perform(params[:operator], params[:num])

    summary_balance = -> do
      BalanceBuilder.new.perform(invoices.summary, params[:start_date], params[:end_date])
    end

    render json: result.errors.any? ? result.errors : summary_balance.call
  end

  def summary
    balance = BalanceBuilder.new.perform(invoices.summary, params[:start_date], params[:end_date])

    render json: balance.as_json
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def invoices
    if params[:start_date] && params[:end_date]
      user.invoices.by_range(params[:start_date].to_date, params[:end_date].to_date)
    else
      user.invoices
    end
  end
end
