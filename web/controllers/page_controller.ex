defmodule Weeksofmaking.PageController do
  use Weeksofmaking.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
