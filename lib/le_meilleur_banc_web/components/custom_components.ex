defmodule LeMeilleurBancWeb.CustomComponents do
  use LeMeilleurBancWeb, :html

  attr :rating, :float, required: true

  def rating(assigns) do
    rating_value = assigns.rating

    formatted_rating =
      if rating_value == trunc(rating_value) do
        trunc(rating_value)
      else
        rating_value
      end

    color_class =
      cond do
        rating_value >= 4.0 -> "text-green-600"
        rating_value >= 3.0 -> "text-orange-500"
        true -> "text-red-600"
      end

    assigns =
      assigns
      |> assign(:display_rating, formatted_rating)
      |> assign(:rating_color_class, color_class)

    ~H"""
    <div class="text-sm text-gray-700">
      <span class="font-semibold">Note :</span>
      <span class={@rating_color_class}>{@display_rating} / 5</span>
    </div>
    """
  end
end
