defmodule UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  alias Ueberauth.Auth
  require IEx

  def find_or_create(%Auth{} = auth) do
    user = %{email: auth.info.email, name: name_from_auth(auth), uid: auth.uid}
      |> WeeksOfMaking.User.create_or_update
    {:ok, user}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end
end
