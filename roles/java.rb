name "java"
description "Java (Oracle) base role"
run_list(
  "role[base]",
  "recipe[java::oracle]"
)
default_attributes(

)
