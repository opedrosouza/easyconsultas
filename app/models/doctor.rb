class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,      type: String
  field :crm,       type: String
  field :crm_uf,    type: String
  field :crm_full,  type: String

  has_many :patients
  has_many :appointments

  validates_presence_of :name, :crm, :crm_uf
  validates_uniqueness_of :crm_full, message: 'Este CRM já está em uso.'

  default_scope -> {order(name: :asc)}

  scope :with_name, lambda {|name| where(:name => name)}
  scope :with_crm, lambda {|crm| where(:crm => crm).or(:crm_full => crm)}
end