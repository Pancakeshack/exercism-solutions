import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(err) = problem
  err
}

pub fn remove_team_prefix(team: String) -> String {
  let assert "Team " <> rest = team
  rest
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let split = string.split_once(combined, ",")
  let assert Ok(res) = split
  #(res.0, remove_team_prefix(res.1))
}
