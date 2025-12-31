import gleam/result

pub fn with_retry(experiment: fn() -> Result(t, e)) -> Result(t, e) {
  case experiment() {
    Ok(value) -> Ok(value)
    Error(_) -> experiment()
  }
}

pub fn record_timing(
  time_logger: fn() -> Nil,
  experiment: fn() -> Result(t, e),
) -> Result(t, e) {
  time_logger()
  let res = experiment()
  time_logger()

  res
}

pub fn run_experiment(
  name: String,
  setup: fn() -> Result(t, e),
  action: fn(t) -> Result(u, e),
  record: fn(t, u) -> Result(v, e),
) -> Result(#(String, v), e) {
  use set <- result.try(setup())
  use act <- result.try(action(set))
  use record <- result.try(record(set, act))
  Ok(#(name, record))
}
