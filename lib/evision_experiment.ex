defmodule EvisionExperiment do
  @moduledoc """
  Documentation for `EvisionExperiment`.
  """
  require Logger
  alias Evision
  alias Nx
  @tmp_image_path "/dev/shm/cv.png"

  @doc """
  Hello world.

  ## Examples

      iex> EvisionExperiment.hello()
      :world

  """
  def hello do
    File.rm(@tmp_image_path)

    Evision.imread("test.png")
    |> lines(1..1000//5 |> Enum.to_list)
    |> display_image()

    :world
  end

  def lines(mat, []), do: mat
  def lines(mat, [x | range]), do: line(mat, x) |> lines(range)

  def line(mat, x) do
    Evision.line(
      mat,
      {0, 0},
      {x, 450},
      {255, 0, 0},
      thickness: 1
    )
  end

  def display_image(binary) do
    Evision.imwrite(@tmp_image_path, binary)
    System.cmd("eog", [@tmp_image_path])
  end
end
