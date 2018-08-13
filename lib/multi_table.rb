# frozen_string_literal: true

require 'active_record'
require 'multi_table/engine'
require 'multi_table/active_record/migration'

# The model concern, to be mixed into the base class in an ActiveRecord inheritance scheme
module MultiTable
  extend ActiveSupport::Concern

  INHERITANCE_COLUMN = 'subclass_type'

  included do
    self.inheritance_column = INHERITANCE_COLUMN
  end
end
