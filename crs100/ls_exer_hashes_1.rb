family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_fam = family.select {|k, v| k == :sisters || k == :brothers }
immediate_fam_arr = immediate_fam.values.flatten

puts "Here are the immediate relations in a fictional family #{immediate_fam_arr}"
