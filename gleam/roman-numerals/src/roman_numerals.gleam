import gleam/string

const mappings = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]

pub fn convert(number: Int) -> String {
  loop(mappings, number, "")
}

fn loop(
  remaining_mappings: List(#(Int, String)),
  num: Int,
  cur: String,
) -> String {
  case remaining_mappings, num {
    [], _ | _, 0 -> cur
    [#(val, symbol), ..rest], _ -> {
      let remainder = num % val
      let appends = num / val
      let part = string.repeat(symbol, appends)
      loop(rest, remainder, cur <> part)
    }
  }
}
