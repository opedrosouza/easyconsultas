arr = []

@doctors.each do |d|
  arr << {
    id: d.id.to_s,
    name: d.name,
    crm: d.crm,
    crm_uf: d.crm_uf,
    crm_full: d.crm_full,
    patients: d.patients
  }
end

json.array! arr