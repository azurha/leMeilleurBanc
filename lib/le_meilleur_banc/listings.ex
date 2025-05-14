defmodule LeMeilleurBanc.Listings do
  @moduledoc """
  The Listings context.
  """

  import Ecto.Query, warn: false
  alias LeMeilleurBanc.Repo

  alias LeMeilleurBanc.Listings.Bench

  @doc """
  Returns the list of benches.

  ## Examples

      iex> list_benches()
      [%Bench{}, ...]

  """
  def list_benches do
    Repo.all(Bench)
  end

  @doc """
  Gets a single bench.

  Raises `Ecto.NoResultsError` if the Bench does not exist.

  ## Examples

      iex> get_bench!(123)
      %Bench{}

      iex> get_bench!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bench!(id), do: Repo.get!(Bench, id)

  @doc """
  Creates a bench.

  ## Examples

      iex> create_bench(%{field: value})
      {:ok, %Bench{}}

      iex> create_bench(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bench(attrs \\ %{}) do
    %Bench{}
    |> Bench.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bench.

  ## Examples

      iex> update_bench(bench, %{field: new_value})
      {:ok, %Bench{}}

      iex> update_bench(bench, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bench(%Bench{} = bench, attrs) do
    bench
    |> Bench.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bench.

  ## Examples

      iex> delete_bench(bench)
      {:ok, %Bench{}}

      iex> delete_bench(bench)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bench(%Bench{} = bench) do
    Repo.delete(bench)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bench changes.

  ## Examples

      iex> change_bench(bench)
      %Ecto.Changeset{data: %Bench{}}

  """
  def change_bench(%Bench{} = bench, attrs \\ %{}) do
    Bench.changeset(bench, attrs)
  end
end
