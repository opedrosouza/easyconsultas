class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :starts_at, type: DateTime
  field :ends_at,   type: DateTime

  belongs_to :doctor
  belongs_to :patient
end
