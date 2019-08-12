class AddColumnExpiredAt < ActiveRecord::Migration[5.2]
  def change
    add_column:tasks,:expired_at,:datetime, default: -> { 'NOW()' }
  end
end
