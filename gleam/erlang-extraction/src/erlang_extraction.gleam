// Please define the GbTree type
pub type GbTree(k, v)

@external(erlang, "gb_trees", "empty")
fn erlang_empty() -> GbTree(k, v)

pub fn new_gb_tree() -> GbTree(k, v) {
  erlang_empty()
}

@external(erlang, "gb_trees", "insert")
fn erlang_insert(key: k, value: v, tree: GbTree(k, v)) -> GbTree(k, v)

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
  erlang_insert(key, value, tree)
}

@external(erlang, "gb_trees", "delete_any")
fn erlang_delete(key: k, tree: GbTree(k, v)) -> GbTree(k, v)

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
  erlang_delete(key, tree)
}
