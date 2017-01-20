defmodule WeeksOfMaking.UserController do
  use WeeksOfMaking.Web, :controller

  alias WeeksOfMaking.User

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end
end
