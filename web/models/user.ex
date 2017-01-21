defmodule WeeksOfMaking.User do
  @moduledoc """
  A User record, storing information retrieved from Facebook
  """

  use WeeksOfMaking.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :uid, :string
    field :token, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :uid, :token])
    |> validate_required([:name, :email, :uid, :token])
  end

  @doc """
  Finds or creates a user given an `email`.
  """
  def create_or_update(params, key_field \\ :uid) do
    User
    |> where(^[{key_field, params[key_field]}])
    |> Repo.one
    |> case do
      nil ->
        %User{}
        |> User.changeset(params)
        |> Repo.insert
        |> case do
          {:ok, user} ->
            user
          {:error, _changeset} ->
            raise "No user found or created"
        end
      user ->
        user
        |> User.changeset(params)
        |> Repo.update
        |> case do
          {:ok, user} ->
            user
          {:error, _changeset} ->
            raise "User couldn't be updated"
        end
    end
  end
end
