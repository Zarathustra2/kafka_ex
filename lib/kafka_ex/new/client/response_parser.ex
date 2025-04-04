defmodule KafkaEx.New.Client.ResponseParser do
  @moduledoc """
  This module is used to parse response from KafkaEx.New.Client.
  It's main decision point which protocol to use for parsing response
  """
  alias KafkaEx.New.Structs.ConsumerGroup
  alias KafkaEx.New.Structs.Error
  alias KafkaEx.New.Structs.Offset

  @protocol Application.compile_env(:kafka_ex, :protocol, KafkaEx.New.Protocols.KayrockProtocol)

  @doc """
  Parses response for Describe Groups API
  """
  @spec describe_groups_response(term) :: {:ok, [ConsumerGroup.t()]} | {:error, term}
  def describe_groups_response(response) do
    @protocol.parse_response(:describe_groups, response)
  end

  @doc """
  Parses response for List Groups API
  """
  @spec list_offsets_response(term) :: {:ok, [Offset.t()]} | {:error, Error.t()}
  def list_offsets_response(response) do
    @protocol.parse_response(:list_offsets, response)
  end
end
