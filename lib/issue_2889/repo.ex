defmodule Issue2889.Repo do
  use Ecto.Repo,
    otp_app: :issue_2889,
    adapter: Ecto.Adapters.Postgres
end
