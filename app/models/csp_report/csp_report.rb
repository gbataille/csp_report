module CspReport
  class CspReport < ActiveRecord::Base
    validates_presence_of :document_uri, :violated_directive, :original_policy,
      :incoming_ip
  end
end
