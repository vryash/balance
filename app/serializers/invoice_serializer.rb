class InvoiceSerializer
  include JSONAPI::Serializer

  attributes :created_at, :user_id

  attribute :balance do |obj|
    [obj.operator, obj.amount].join
  end
end
