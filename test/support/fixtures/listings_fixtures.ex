defmodule LeMeilleurBanc.ListingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LeMeilleurBanc.Listings` context.
  """

  @doc """
  Generate a bench.
  """
  def bench_fixture(attrs \\ %{}) do
    {:ok, bench} =
      attrs
      |> Enum.into(%{
        address: "some address",
        latitude: 120.5,
        longitude: 120.5,
        name: "some name",
        photo_url: "some photo_url",
        status: "some status",
        uploader_comment: "some uploader_comment",
        uploader_rating: 42
      })
      |> LeMeilleurBanc.Listings.create_bench()

    bench
  end
end
