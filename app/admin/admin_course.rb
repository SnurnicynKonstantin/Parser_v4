ActiveAdmin.register Course do
  index do
    selectable_column
    id_column
    column :usd
    column :eur
    column :date
    actions
  end

  filter :usd
  filter :eur
  filter :date
  filter :created_at

  form do |f|
    f.inputs "Course Details" do
      f.input :usd
      f.input :eur
      f.input :date
    end
    f.actions
  end
end