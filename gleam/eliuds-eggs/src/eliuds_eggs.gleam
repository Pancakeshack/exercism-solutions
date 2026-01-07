pub fn egg_count(number: Int) -> Int {
  let bits = <<number:size(64)>>
  do_count(bits, 0)
}

fn do_count(eggs: BitArray, acc: Int) -> Int {
  case eggs {
    <<bit:1, rest:bits>> -> {
      case bit {
        1 -> do_count(rest, acc + 1)
        _ -> do_count(rest, acc)
      }
    }
    _ -> acc
  }
}
