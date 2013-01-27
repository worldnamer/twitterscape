class Hash
  def to_array_of_hashes(key_name, value_name)
    map { |key, value| { key_name.to_sym => key, value_name.to_sym => value } }
  end
end