class MoneyTransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :creditor, :debitor, :amount, :paid_at
end
