import gleam/string

pub fn reverse(value: String) -> String {
  value |> do_reverse("")
}

fn do_reverse(s: String, acc: String) -> String {
  case string.pop_grapheme(s) {
    Ok(#(c, rest)) -> do_reverse(c <> acc, rest)
    _ -> acc
  }
}
