import gleam/float
import gleam/list
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
  let temp1 = c_from_temp(left)
  let temp2 = c_from_temp(right)

  float.compare(temp1, temp2)
}

fn c_from_temp(temp: Temperature) -> Float {
  case temp {
    Celsius(val) -> val
    Fahrenheit(val) -> fahrenheit_to_celsius(val)
  }
}

fn compare_cities(left: City, right: City) -> Order {
  compare_temperature(left.temperature, right.temperature)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, by: compare_cities)
}
