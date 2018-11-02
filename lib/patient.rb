require_relative './doctor'
require_relative './appointment'

class Patient

  attr_accessor :name, :doctors, :appointments

@@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(self, doctor, date)
  end

  def appointments
      Appointment.all.select do |each_apt|
        each_apt.patient == self
    end
  end

  def doctors
    self.appointments.map do |my_apts|
      my_apts.doctor
    end

  end

end
