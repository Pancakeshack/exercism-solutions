import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  path
  |> simplifile.read
  |> result.replace_error(Nil)
  |> result.map(fn(content) {
    string.split(content, "\n")
    |> list.filter(fn(line) { line != "" })
  })
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  path
  |> simplifile.create_file
  |> result.replace_error(Nil)
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  path
  |> simplifile.append(email <> "\n")
  |> result.replace_error(Nil)
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.try(create_log_file(log_path))
  use emails <- result.try(read_emails(emails_path))

  list.each(emails, fn(email) {
    case send_email(email) {
      Ok(_) -> {
        let _ = log_sent_email(log_path, email)
        Nil
      }
      Error(_) -> Nil
    }
  })
  
  Ok(Nil)
}
