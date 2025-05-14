defmodule LeMeilleurBanc.ListingsTest do
  use LeMeilleurBanc.DataCase

  alias LeMeilleurBanc.Listings

  describe "benches" do
    alias LeMeilleurBanc.Listings.Bench

    import LeMeilleurBanc.ListingsFixtures

    @invalid_attrs %{name: nil, status: nil, address: nil, latitude: nil, longitude: nil, photo_url: nil, uploader_comment: nil, uploader_rating: nil}

    test "list_benches/0 returns all benches" do
      bench = bench_fixture()
      assert Listings.list_benches() == [bench]
    end

    test "get_bench!/1 returns the bench with given id" do
      bench = bench_fixture()
      assert Listings.get_bench!(bench.id) == bench
    end

    test "create_bench/1 with valid data creates a bench" do
      valid_attrs = %{name: "some name", status: "some status", address: "some address", latitude: 120.5, longitude: 120.5, photo_url: "some photo_url", uploader_comment: "some uploader_comment", uploader_rating: 42}

      assert {:ok, %Bench{} = bench} = Listings.create_bench(valid_attrs)
      assert bench.name == "some name"
      assert bench.status == "some status"
      assert bench.address == "some address"
      assert bench.latitude == 120.5
      assert bench.longitude == 120.5
      assert bench.photo_url == "some photo_url"
      assert bench.uploader_comment == "some uploader_comment"
      assert bench.uploader_rating == 42
    end

    test "create_bench/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Listings.create_bench(@invalid_attrs)
    end

    test "update_bench/2 with valid data updates the bench" do
      bench = bench_fixture()
      update_attrs = %{name: "some updated name", status: "some updated status", address: "some updated address", latitude: 456.7, longitude: 456.7, photo_url: "some updated photo_url", uploader_comment: "some updated uploader_comment", uploader_rating: 43}

      assert {:ok, %Bench{} = bench} = Listings.update_bench(bench, update_attrs)
      assert bench.name == "some updated name"
      assert bench.status == "some updated status"
      assert bench.address == "some updated address"
      assert bench.latitude == 456.7
      assert bench.longitude == 456.7
      assert bench.photo_url == "some updated photo_url"
      assert bench.uploader_comment == "some updated uploader_comment"
      assert bench.uploader_rating == 43
    end

    test "update_bench/2 with invalid data returns error changeset" do
      bench = bench_fixture()
      assert {:error, %Ecto.Changeset{}} = Listings.update_bench(bench, @invalid_attrs)
      assert bench == Listings.get_bench!(bench.id)
    end

    test "delete_bench/1 deletes the bench" do
      bench = bench_fixture()
      assert {:ok, %Bench{}} = Listings.delete_bench(bench)
      assert_raise Ecto.NoResultsError, fn -> Listings.get_bench!(bench.id) end
    end

    test "change_bench/1 returns a bench changeset" do
      bench = bench_fixture()
      assert %Ecto.Changeset{} = Listings.change_bench(bench)
    end
  end
end
