class BalanceSerializer
  include JSONAPI::Serializer

  attributes :start_date, :end_date, :balance
end
