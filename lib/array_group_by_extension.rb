class Array
  # Stolen from: http://iain.nl/monkey-patch-of-the-month-group_by
  #
  # Turns an array into a hash, using the results of the block as keys for the
  # hash.
  #
  #   [1, 2, 3, 4].group_by(&:odd?)
  #   # => {true=>[1, 3], false=>[2, 4]}
  #
  #   ["One", "Two", "three"].group_by {|i| i[0,1].upcase }
  #   # => {"T"=>["Two", "three"], "O"=>["One"]}
  def group_by
    hash = Hash.new { |hash, key| hash[key] = [] }
    each { |item| hash[yield(item)] << item }
    hash
  end
end