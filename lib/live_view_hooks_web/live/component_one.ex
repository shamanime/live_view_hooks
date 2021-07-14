defmodule ComponentOne do
  use Phoenix.LiveComponent

  def update(_assigns, socket) do
    {:ok, push_event(socket, "one", %{title: Ecto.UUID.generate()})}
  end

  def render(assigns) do
    ~L"""
    <p id="one" phx-hook="One">The new title will appear here</p>
    """
  end
end
