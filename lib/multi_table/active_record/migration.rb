# frozen_string_literal: true

module MultiTable
  module Migration
    # Adds the `#with_subclass` migration helper to automatically add the `#subclass_type`
    # and `#subclass_id` columns used by `MultiTable` to track subclass tables
    module TableDefinition
      def with_subclasses(options = {})
        references(:subclass, options.merge(polymorphic: true))
      end
    end

    # Adds the `#remove_with_subclass` migration helper to automatically remove the
    # `#subclass_type` and `#subclass_id` columns used by `MultiTable` to track subclass tables
    module Table
      include TableDefinition

      def remove_with_subclasses(options = {})
        @base.remove_reference(@name, :subclass, options.merge(polymorphic: true))
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
