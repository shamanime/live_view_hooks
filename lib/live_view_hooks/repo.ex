defmodule LiveViewHooks.Repo do
  use Ecto.Repo,
    otp_app: :live_view_hooks,
    adapter: Ecto.Adapters.Postgres
end
