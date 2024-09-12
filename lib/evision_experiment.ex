defmodule EvisionExperiment do
  @moduledoc """
  Documentation for `EvisionExperiment`.
  """
  alias Evision, as: Cv
  @tmp_image_path "/dev/shm/cv.png"

  @doc """
  Hello world.

  ## Examples

      iex> EvisionExperiment.hello()
      :world

  """
  def hello do
    lenna_test_image_path = "test.png"
    Cv.imread(lenna_test_image_path, flags: Cv.Constant.cv_IMREAD_GRAYSCALE())
    |> display_image()

    :world
  end

  def display_image(binary) do
    Cv.imwrite(@tmp_image_path, binary)
    System.cmd("eog", [@tmp_image_path])
  end
end
