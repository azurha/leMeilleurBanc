defmodule LeMeilleurBancWeb.Home do
  use LeMeilleurBancWeb, :live_view

  alias LeMeilleurBanc.Listings
  alias LeMeilleurBancWeb.CustomComponents

  def mount(_params, _session, socket) do
    socket = stream(socket, :listings, Listings.list_benches())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen p-4 md:p-8">
      <h1 class="text-4xl font-bold text-stone-800 mb-6 text-center md:text-left">Liste des bancs</h1>
      <div class="space-y-6" id="listings" phx-update="stream">
        <.bench_card
          :for={{dom_id, bench} <- @streams.listings}
          photo_url={bench.photo_url}
          name={bench.name}
          uploader_comment={bench.uploader_comment}
          uploader_rating={bench.uploader_rating}
          id={dom_id}
        />
      </div>
    </div>
    """
  end

  attr :photo_url, :string, required: true
  attr :name, :string, required: true
  attr :uploader_comment, :string, required: true
  attr :uploader_rating, :float, required: true
  attr :id, :string, required: true

  def bench_card(assigns) do
    ~H"""
    <div
      id={@id}
      class="max-w-md mx-auto bg-orange-50 rounded-xl shadow-md overflow-hidden md:max-w-2xl"
    >
      <div class="md:flex">
        <div class="md:shrink-0">
          <img class="h-48 w-full object-cover md:h-full md:w-48" src={@photo_url} alt={@name} />
        </div>
        <div class="p-8">
          <h2 class="block mt-1 text-2xl leading-tight font-bold text-black">{@name}</h2>
          <p class="mt-2 text-slate-600 text-sm">{@uploader_comment}</p>
          <div class="mt-4 flex justify-between items-center">
            <CustomComponents.rating rating={@uploader_rating} />
            <p class="text-slate-500 text-sm">À environ 200 m</p>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
