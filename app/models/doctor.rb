class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :crm, type: String
  field :crm_uf, type: String

  has_many :patients
  has_many :appointments
end
