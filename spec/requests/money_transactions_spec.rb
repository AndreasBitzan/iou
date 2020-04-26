# frozen_string_literal: true

# file /spec/requests/money_transactions_spec.rb

require 'swagger_helper'

RSpec.describe 'Stand Alone API', type: :request do
  describe 'MoneyTransactions' do
    fixtures :money_transactions
    before { @money_transaction = money_transactions(:one) }
    path '/money_transactions.json' do
      get 'list all the transactions' do
        tags 'MoneyTransaction'
        produces 'application/json'

        response(200, 'successful') do
          schema type: :object,
                 properties: {
                   data: {
                     type: :array,
                     items: {
                       type: :object,
                       properties: {
                         id: { type: :string },
                         type: { type: :string },
                         attributes: {
                           type: :object,
                           properties: {
                            id: { type: :integer },
                             creditor: { type: :string },
                             debitor: { type: :string },
                             amount: { type: :integer },
                           },
                           required: %w[creditor debitor]
                         }
                       },
                       required: %w[id type attributes]
                     }
                   }
                 }
          run_test!
        end
      end

      # echtes json:api
      #  curl -X POST "http://localhost:3000/api/v1/users/" \
      #  -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json'  \
      #     --data "{\"data\":{\"type\":\"user\",\"attributes\":{\"name\":\"Ember\",\"email\":\"ember@hier.com\",\"password\":\"geheim\"}}}"

    end
    end
end
