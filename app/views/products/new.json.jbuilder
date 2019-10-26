json.array! @category_children do |child|
  json.id child.id
  json.name child.name
end

json.array! @category_grandchildren do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end

json.array! @delivery_method1 do |value, key|
  json.id key
  json.name value
end

json.array! @delivery_method2 do |value, key|
  json.id key
  json.name value
end