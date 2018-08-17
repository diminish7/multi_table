# frozen_string_literal: true

module MultiTable
  # Namespace for auto-generated classes
  module PolymorphicClass; end

  # Generates a new ActiveRecord class for interacting with secondary tables.
  class PolymorphicClassFactory
    attr_reader :parent_klass

    def initialize(parent_klass)
      @parent_klass = parent_klass
    end

    def call
      inferred_table_name = parent_klass.name.underscore.pluralize

      klass = Class.new(ActiveRecord::Base) do
        self.table_name = inferred_table_name
      end

      MultiTable::PolymorphicClass.const_set(parent_klass.name, klass)
    end
  end
end
