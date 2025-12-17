// Please define the TreasureChest generic custom type
pub type TreasureChest(t) {
  TreasureChest(String, t)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(t) {
  Unlocked(t)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(pass, treasure) if password == pass -> Unlocked(treasure)
    _ -> WrongPassword
  }
}
