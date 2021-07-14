defmodule ComponentTwo do
  use Phoenix.LiveComponent

  def update(_assigns, socket) do
    {:ok, assign(socket, :title, Ecto.UUID.generate())}
  end

  def render(assigns) do
    ~L"""
    <div id="two">
      <p id="two-hook" phx-hook="Two" data-title="<%= @title %>">The title will appear here</p>
      <button type="button" phx-click="change_title" phx-target="<%= @myself %>">Change title</button>
    </div>
    """
  end

  def handle_event("get_title", _params, socket) do
    {:noreply, push_event(socket, "two", %{title: socket.assigns.title})}
  end

  def handle_event("change_title", _params, socket) do
    socket = assign(socket, :title, Ecto.UUID.generate())
    {:noreply, push_event(socket, "two", %{title: socket.assigns.title})}
  end
end
