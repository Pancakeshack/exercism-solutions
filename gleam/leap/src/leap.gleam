pub fn is_leap_year(year: Int) -> Bool {
  let leap_year = year % 4 == 0
  let one_hundred_check = year % 100 == 0

  case one_hundred_check {
    True -> leap_year && year % 400 == 0
    False -> leap_year
  }
}
