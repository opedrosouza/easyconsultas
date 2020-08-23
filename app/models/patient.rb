require 'cpf_cnpj'
class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,        type: String
  field :birth_date,  type: Date
  field :cpf,         type: String

  belongs_to :doctor
  has_many :appointments

  validates_presence_of :name, :birth_date, :cpf
  validates_uniqueness_of :cpf
  validate :validar_cpf

  def validar_cpf
    errors.add(:base, 'CPF inválido') unless CPF.valid? self.cpf
  end
end
