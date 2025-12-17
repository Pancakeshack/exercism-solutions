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
  let convert = fn(x: Temperature) {
    case x {
      Celsius(val) -> val
      Fahrenheit(val) -> fahrenheit_to_celsius(val)
    }
  }

  float.compare(convert(left), convert(right))
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(fn(a, b) { compare_temperature(a.temperature, b.temperature) })
}
