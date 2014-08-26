module ReadOnlyModel
  extend ActiveSupport::Concern
 
  included do
    attr_readonly(*column_names) # Required to block update_attribute and update_column
  end
 
  def readonly?
    true # Does not block destroy or delete
  end
 
  def destroy
    raise ActiveRecord::ReadOnlyRecord
  end
 
  def delete
    raise ActiveRecord::ReadOnlyRecord
  end
end