module InspectTemplate

  def __inspect_template(objs, refs)
    obj_output = objs.sort.each_with_object("") do |v,out|
      out << "\n       #{v}: #{instance_variable_get(v).inspect}"
    end

    ref_output = refs.sort.each_with_object("") do |v,out|
      ref = instance_variable_get(v)
      out << "\n       #{v} -> #{__inspect_object_tag(ref)}"
    end

    "< #{__inspect_object_tag(self)}: #{obj_output}\n#{ref_output} >"
  end

  def __inspect_object_tag(obj)
    "#{obj.class}:0x#{object.object_id.to_s(16)}"
  end
end
