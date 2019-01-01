# frozen_string_literal: true

module MultiTable
  # Query helpers
  module SubclassQuery
    extend ActiveSupport::Concern

    class_methods do # rubocop:disable BlockLength
      # Override: If this is a `MultiTable` subclass, and the query is to be built from a hash,
      #           this will delegate any columns from the subclass table to a JOIN on that table
      def where(opts, *rest)
        if opts.is_a?(Hash) && opts.keys.any? { |key| secondary_table_column?(key) }
          super(opts_for_secondary_table_join(opts), *rest).joins(secondary_table_join_sql)
        else
          super(opts, *rest)
        end
      end

      private

      def secondary_table_columns_set
        @secondary_table_columns_set ||= Set.new(
          polymorphic_class.column_names - [polymorphic_class.primary_key]
        )
      end

      def secondary_table_column?(key)
        secondary_table_columns_set.include?(key.to_s)
      end

      def opts_for_secondary_table_join(opts)
        join_table = polymorphic_class.table_name.to_sym

        { join_table => {} }.tap do |updated_ops|
          opts.each do |key, value|
            if secondary_table_column?(key)
              updated_ops[join_table][key] = value
            else
              updated_ops[key] = value
            end
          end
        end
      end

      def secondary_table_join_sql
        "INNER JOIN #{polymorphic_class.quoted_table_name} " \
          "ON #{polymorphic_class.quoted_table_name}.#{connection.quote_column_name(:id)} = " \
          "#{quoted_table_name}.#{connection.quote_column_name(:multi_table_id)}"
      end
    end
  end
end
