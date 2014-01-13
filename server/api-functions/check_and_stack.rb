def check_and_stack( fields, params, types )
  values = []
  fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }

  return nil if !Freetable.new.validate(values, types)
  return values
end
