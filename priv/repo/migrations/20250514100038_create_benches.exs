defmodule LeMeilleurBanc.Repo.Migrations.CreateBenches do
  use Ecto.Migration

  def change do
    create table(:benches) do
      add :name, :string
      add :address, :text
      add :latitude, :float
      add :longitude, :float
      add :photo_url, :string
      add :uploader_comment, :text
      add :uploader_rating, :float
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:benches, [:user_id])
  end
end
