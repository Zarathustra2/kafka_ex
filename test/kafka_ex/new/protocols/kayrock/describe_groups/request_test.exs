defmodule KafkaEx.New.Protocols.Kayrock.DescribeGroups.RequestTest do
  use ExUnit.Case, async: true

  alias KafkaEx.New.Protocols.DescribeGroups

  alias Kayrock.DescribeGroups.V0
  alias Kayrock.DescribeGroups.V1

  describe "build_request/2" do
    test "for api version 0 - builds describe group request" do
      groups = ["group1", "group2"]

      assert %V0.Request{
               group_ids: groups
             } == DescribeGroups.Request.build_request(%V0.Request{}, groups)
    end

    test "for api version 1 - builds describe group request" do
      groups = ["group1", "group2"]

      assert %V1.Request{
               group_ids: groups
             } == DescribeGroups.Request.build_request(%V1.Request{}, groups)
    end
  end
end
