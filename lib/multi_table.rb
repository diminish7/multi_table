# frozen_string_literal: true

require 'active_record'
require 'multi_table/engine'
require 'multi_table/polymorphic_class_factory'
require 'multi_table/active_record/migration'

# The model concern, to be mixed into the base class in an ActiveRecord inheritance scheme
module MultiTable
  extend ActiveSupport::Concern

  included do
    belongs_to :multi_table, polymorphic: true

    default_scope -> { includes(:multi_table) }

    after_initialize :init_multi_table

    delegate :polymorphic_class, to: :class
  end

  class_methods do
    attr_reader :polymorphic_class

    def inherited(subclass)
      subclass.instance_eval do
        @polymorphic_class = MultiTable::PolymorphicClassFactory.new(subclass).call

        polymorphic_class.columns.map(&:name).each do |column_name|
          next if column_name == polymorphic_class.primary_key
          delegate :"#{column_name}", to: :multi_table
          delegate :"#{column_name}=", to: :multi_table
        end
      end
      super
    end
  end

  private

  def init_multi_table
    return if type.blank? || multi_table.present?
    self.multi_table = polymorphic_class.new
  end
end
