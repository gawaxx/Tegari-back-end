class ReportSerializer < ActiveModel::Serializer
  attributes :id, :user_reported_id, :user_reporting_id, :reason_reporting, :post_id_reported
end
