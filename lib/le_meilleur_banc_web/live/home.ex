defmodule LeMeilleurBancWeb.Home do
  use LeMeilleurBancWeb, :live_view

  alias LeMeilleurBanc.Listings

  def mount(_params, _session, socket) do
    socket = assign(socket, :listings, Listings.list_benches())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen p-4 md:p-8">
      <h1 class="text-4xl font-bold text-stone-800 mb-6 text-center md:text-left">Liste des bancs</h1>
      <div class="space-y-6">
        <.bench_card
          :for={bench <- @listings}
          photo_url={bench.photo_url}
          name={bench.name}
          uploader_comment={bench.uploader_comment}
          uploader_rating={bench.uploader_rating}
        />
      </div>
    </div>
    """
  end

  def bench_card(assigns) do
    ~H"""
    <div class="max-w-md mx-auto bg-orange-50 rounded-xl shadow-md overflow-hidden md:max-w-2xl">
      <div class="md:flex">
        <div class="md:shrink-0">
          <img class="h-48 w-full object-cover md:h-full md:w-48" src={@photo_url} alt={@name} />
        </div>
        <div class="p-8">
          <h2 class="block mt-1 text-2xl leading-tight font-bold text-black">{@name}</h2>
          <p class="mt-2 text-slate-600 text-sm">{@uploader_comment}</p>
          <div class="mt-4 flex justify-between items-center">
            <.rating rating={@uploader_rating} />
            <p class="text-slate-500 text-sm">À environ 200 m</p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def rating(assigns) do
    rating_value = assigns.rating

    formatted_rating =
      if rating_value == trunc(rating_value) do
        trunc(rating_value)
      else
        rating_value
      end

    assigns = assign(assigns, :display_rating, formatted_rating)

    ~H"""
    <div class="text-sm text-gray-700">
      <span class="font-semibold">Note :</span>
      <span>{@display_rating} / 5</span>
    </div>
    """
  end
end
