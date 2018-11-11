#1 "Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word. -

a = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
a.each do |wrd|
  if wrd.downcase =~ /lab/ #assuming case doesn't matter; if it does, drop .downcase
    p wrd
  end
end
