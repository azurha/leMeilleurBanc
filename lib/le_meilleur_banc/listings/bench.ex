defmodule LeMeilleurBanc.Listings.Bench do
  use Ecto.Schema
  import Ecto.Changeset

  schema "benches" do
    field :name, :string
    field :status, :string
    field :address, :string
    field :latitude, :float
    field :longitude, :float
    field :photo_url, :string
    field :uploader_comment, :string
    field :uploader_rating, :float
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bench, attrs) do
    bench
    |> cast(attrs, [
      :name,
      :address,
      :latitude,
      :longitude,
      :photo_url,
      :uploader_comment,
      :uploader_rating,
      :status
    ])
    |> validate_required([
      :name,
      :address,
      :latitude,
      :longitude,
      :photo_url,
      :uploader_comment,
      :uploader_rating,
      :status
    ])
  end
end
