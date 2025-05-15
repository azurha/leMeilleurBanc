defmodule LeMeilleurBancWeb.Home do
  use LeMeilleurBancWeb, :live_view

  alias LeMeilleurBanc.Listings

  def mount(_params, _session, socket) do
    socket = assign(socket, :listings, Listings.list_benches())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Home</h1>

      <div :for={bench <- @listings}>
        <h2>{bench.name}</h2>
        <p>{bench.uploader_comment}</p>
        <div>
          <img src={static_path(@socket, bench.photo_url)} alt={bench.name} />
        </div>
        <div>
          {bench.uploader_rating}
        </div>
      </div>
    </div>
    """
  end
end
