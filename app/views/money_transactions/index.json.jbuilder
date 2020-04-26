json.array! @money_transactions do |money_transaction|
    json.extract! money_transaction, :creditor, :debitor, :amount
end