module Incoterms
  class Base

    attr_reader :id, :code, :concept, :description, :transport_rule

    def initialize(id)
      @id = id.downcase.to_sym
      raise "Invalid code Incoterm. Codes accepted are: #{CODES.join(', ')}" unless self.class::CODES.include?(@id)

      initialize_incoterm!
    end

    class << self
      def all
        Incoterms.load_data.map do |code, _data|
          new(code)
        end
      end
    end

    private

    def initialize_incoterm!
      data = Incoterms.load_data[@id]
      @code           = data[:code]
      @concept        = data[:concept]
      @description    = data[:description]
      @transport_rule = data[:transport_rule]
    end
  end
end