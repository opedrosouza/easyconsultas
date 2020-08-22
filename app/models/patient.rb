class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :birth_date, type: String
  field :cpf, type: String

  belongs_to :doctor
  has_many :appointments
end
