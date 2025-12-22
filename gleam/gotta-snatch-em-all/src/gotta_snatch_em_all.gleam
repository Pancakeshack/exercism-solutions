import gleam/list
import gleam/result
import gleam/set.{type Set}

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  let exists = set.contains(collection, card)
  #(exists, set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let can_trade =
    set.contains(collection, my_card) && !set.contains(collection, their_card)
  let collection =
    collection
    |> set.insert(their_card)
    |> set.delete(my_card)

  #(can_trade, collection)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), set.union)
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(a) {
    case a {
      "Shiny " <> _ -> True
      _ -> False
    }
  })
}
