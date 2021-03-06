require_relative 'train'
require_relative '../railway_carriage/cargo_railway_carriage'

class CargoTrain < Train
  # >> Validation rules
  NUMBER_FORMAT = /^\w\w\w-?\w\w\z/
  validate :dispatcher, :type, TrainDispatcher
  validate :number, :format, NUMBER_FORMAT
  # << Validation rules

  def type
    'Cargo train'
  end

  protected

  # Использую guard вместо оборачивания через if
  def hook_railway_carriage(railway_carriage)
    return unless railway_carriage.instance_of? CargoRailwayCarriage

    super
    # К примеру проверим тормоза при подсоединении вагона
    check_brake
  end

  # Использую guard вместо оборачивания через if
  def unhook_railway_carriage(railway_carriage)
    return unless railway_carriage.instance_of? CargoRailwayCarriage

    super
    check_brake
  end

  def check_brake
    puts 'Brake on cargo train is good chief!'
  end
end
