class ListData
  def list(index, data)
    print "#{index + 1}) "
    data.each { |key, value| print "#{key}: #{value}  \t" unless value.nil? }
    puts
  end

  def get_properties(item, index, prop_names, props)
    hash = {
      'ID' => item.id,
      'Publish Date' => item.publish_date
    }
    hash['Label'] = item.label.title if item.label

    props.each_with_index { |prop, id| hash[prop_names[id]] = prop }

    list(index, hash)
  end
end
