defmodule Issue2889Web.Live.Index do
  @moduledoc false

  use Issue2889Web, :live_view

  def render(assigns) do
    ~H"""
    <div :if={@show} />
    <div id="editor-container" phx-update="ignore">
      <div id="editor" phx-hook="EditorHook" data-content="<span>Hello, World.</span>" />
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, show: false)}
  end

  def handle_event("show", %{"show" => show}, socket) do
    {:noreply, assign(socket, show: show)}
  end
end
