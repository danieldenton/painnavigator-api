class AddEducationProgressToEducationModuleCompletion < ActiveRecord::Migration[6.1]
  def change
    add_column :education_module_completions, :education_progress, :integer
  end
end
