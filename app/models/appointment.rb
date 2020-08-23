class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :starts_at, type: DateTime
  field :ends_at,   type: DateTime

  belongs_to :doctor
  belongs_to :patient

  validates_presence_of :starts_at, :ends_at
  validate :validar_horario

  scope :da_data, lambda { |data| where(starts_at: data) }

  def validar_horario
    inicio_atendimento = horario(9)
    fim_atendimento = horario(18)
    inicio_intervalo = horario(12)
    fim_intervalo = horario(14)

    
    if self.starts_at > inicio_atendimento and self.starts_at < fim_atendimento
      if self.starts_at < inicio_intervalo or self.starts_at > fim_intervalo
        if self.ends_at <= (self.starts_at + 30.minute)
          if Appointment.da_data(self.starts_at).count === 0
            true
          else
            errors.add(:base, 'O Horário selecionado já possui uma consulta agendada.')
          end
        else
          errors.add(:base, 'Não é possível agendar consulta com tempo maior que 30 minutos.')
        end
      else
        errors.add(:base, 'Não é possível agendar consulta no horário do intervalo.')
      end
    else
      errors.add(:base, 'Não é possível agendar consulta fora do horário de atendimento.')
    end
  end

  def horario hora
    data = self.starts_at
    DateTime.new(data.year, data.month, data.day, hora)
  end
end
