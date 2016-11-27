require_relative 'models/train/train_dispatcher'
require_relative 'models/station'
require_relative 'models/train/train_route'
require_relative 'models/train/train'
require_relative 'models/train/passenger_train'
require_relative 'models/train/cargo_train'
require_relative 'models/railway_carriage/railway_carriage'
require_relative 'models/railway_carriage/passenger_railway_carriage'
require_relative 'models/railway_carriage/cargo_railway_carriage'

module Demo
  def Demo::SeedDemoData
    # Create stations
    first_station = Station.new(name: "Moscow")
    second_station = Station.new(name: "Voronej")
    third_station = Station.new(name: "Rostov")
    fourth_station = Station.new(name: "Krasnodar")
    last_station = Station.new(name: "Adler")

    # Train route
    train_route = TrainRoute.new(first_station, last_station)
    train_route.insert_station(second_station)
    train_route.insert_station(third_station)
    train_route.insert_station(fourth_station)

    # Train
    train = PassengerTrain.new(number: '223-DS')
    train.set_train_route(train_route)
    train.manufacturer = 'Telco Ind.'

    train2 = CargoTrain.new(number: 'MKD05')
    train2.set_train_route(train_route)
    train2.manufacturer = 'Tenemut Inc.'

    train3 = PassengerTrain.new(number: '005-RF')
    train3.set_train_route(train_route)
    train3.manufacturer = 'OCP corp.'

    wagon = CargoRailwayCarriage.new
    train2.add_railway_carriage(wagon)

    passenger_wagon = PassengerRailwayCarriage.new
    train.add_railway_carriage(passenger_wagon)
  end
end