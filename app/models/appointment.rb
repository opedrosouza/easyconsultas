class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :starts_at, type: String
  field :ends_at, type: String

  belongs_to :doctor
  belongs_to :patient
end
