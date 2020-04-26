class MoneyTransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :creditor, :debitor, :amount
end
