defmodule TwittrTest do
  use Twittr.DataCase

  describe "statuses" do
    alias Twittr.Status

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twittr.create_status()

      status
    end

    test "list_statuses/0 returns all statuses" do
      status = status_fixture()
      assert Twittr.list_statuses() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Twittr.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = Twittr.create_status(@valid_attrs)
      assert status.text == "some text"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twittr.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      assert {:ok, status} = Twittr.update_status(status, @update_attrs)
      assert %Status{} = status
      assert status.text == "some updated text"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = Twittr.update_status(status, @invalid_attrs)
      assert status == Twittr.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Twittr.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Twittr.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Twittr.change_status(status)
    end
  end
end
