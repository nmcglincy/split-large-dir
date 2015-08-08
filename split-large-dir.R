# This script splits a directory into a number of subdirectories.
# No spaces in file names please.
# 
# initiate counter
a = 1
while (length(list.files(include.dirs = FALSE)) > 100) {
  # 
  # system call - make folder based on the counter
  system(paste("mkdir ", "russ-pics-", a, sep = ""))
  # 
  # make a list of the files in the directory, not including the folders
  files = list.files(include.dirs = FALSE)
  # 
  # system call - move the first 100 files on the file list into the folder
  for (i in files[1:100]) {
    system(paste("mv", i, paste("russ-pics-", a, sep = ""), sep = " "))
  }
  # 
  # counter + 1
  a = a + 1
  # TODO - system call - zip all the directories in the top dir
}
# 
# Dealing with the leftovers:
system(paste("mkdir ", "russ-pics-", a, sep = ""))
files = list.files(include.dirs = FALSE)
for (i in files[1:length(files)]) {
  system(paste("mv", i, paste("russ-pics-", a, sep = ""), sep = " "))
}