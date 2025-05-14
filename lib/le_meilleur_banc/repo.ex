defmodule LeMeilleurBanc.Repo do
  use Ecto.Repo,
    otp_app: :le_meilleur_banc,
    adapter: Ecto.Adapters.Postgres
end
