require_relative './patient'
require_relative './appointment'
class Doctor

attr_accessor :name, :appointments, :patients

@@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    Appointment.new(patient, self, date)
  end

  def appointments
    Appointment.all.select do |each_apt|
      each_apt.doctor == self
    end
  end

  def patients
    self.appointments.map do |my_apts|
      my_apts.patient
    end
  end

end
