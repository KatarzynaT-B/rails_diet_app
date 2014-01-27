json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :sex, :age, :weight, :height, :activity_level, :calories_need, :protein_need, :fat_need, :carbs_need
  json.url profile_url(profile, format: :json)
end
