# frozen_string_literal: true

module MultiTable
  module Migration
    # Adds the `#multi_table` migration helper to automatically add the `#type`, `#multi_table_type`
    # and `#multi_table_id` columns used by `MultiTable` to track subclass tables
    module TableDefinition
      def multi_table(options = {})
        references :multi_table, options.merge(polymorphic: true)
        string :type
      end
    end

    # Adds the `#remove_multi_table` migration helper to automatically remove the
    # `#type`, `#multi_table_type` and `#multi_table_id` columns used by `MultiTable` to
    # track subclass tables
    module Table
      include TableDefinition

      def remove_multi_table(options = {})
        @base.remove_column(@name, :type, :string)
        @base.remove_reference(@name, :multi_table, options.merge(polymorphic: true))
      end
    end
  end
end

# rubocop:disable Documentation
module ActiveRecord
  module ConnectionAdapters
    class TableDefinition
      include MultiTable::Migration::TableDefinition
    end
  end

  module ConnectionAdapters
    class Table
      include MultiTable::Migration::Table
    end
  end
end
# rubocop:enable Documentation
