import gleam/string

pub fn hey(remark: String) -> String {
  let say = string.trim(remark)
  case
    string.ends_with(say, "?"),
    string.uppercase(remark) == remark
    && !{ string.lowercase(remark) == remark },
    string.is_empty(say)
  {
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever."
  }
}
