defprotocol Rulex.DataBag do
  @moduledoc """
  Protocol controlling providing facts to Rulex evaluation functions.

  ## Examples

      defimpl Rulex.DataBag, for: Keyword do
        def get(kw, key, default \\\\ nil) do
          Keyword.get(kw, key, default)
        end
      end
  """
  @spec get(t, any) :: any
  @spec get(t, any, any) :: any
  def get(db, var, default \\ nil)
end

defimpl Rulex.DataBag, for: Map do
  @spec get(Rulex.Databag.t(), any) :: any
  @spec get(Rulex.Databag.t(), any, any) :: any
  defdelegate get(map, var), to: Map
  defdelegate get(map, var, default), to: Map
end
