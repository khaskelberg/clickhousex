defmodule Clickhousex.Codec do
  @moduledoc """
  Behaviour for input and/or output format.

  If none of the out of the box codecs suits your needs, you can
  implement one of [the supported ones][1] yourself.

  [1]: https://clickhouse.tech/docs/en/interfaces/formats/
  """

  @type select_response :: %{column_names: [String.t()], rows: [list], row_count: non_neg_integer}
  @type state :: any

  @callback response_format() :: String.t()
  @callback request_format() :: String.t()
  @callback new() :: state
  @callback append(state, iodata) :: state
  @callback decode(state) :: {:ok, select_response} | {:error, any}
  @callback encode(query :: Clickhousex.Query.t(), param_replacements :: iodata, params :: [any]) :: iodata
end
