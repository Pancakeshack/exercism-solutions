import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

const subtract = 32.0

const divide = 1.8

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. subtract } /. divide
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  todo
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  todo
}
