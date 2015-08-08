# This script splits a directory into a number of subdirectories.
# No spaces in file names please.
# 
dir.root = "russ-pics-"
files.per.dir = 200
# TODO - somehow it put 1 more than this into each folder, fix this if it
# ever becomes important
# 
# initiate counter
a = 1
while (length(Sys.glob("*.*")) > files.per.dir) {
  # 
  # system call - make folder based on the counter
  system(paste("mkdir ", dir.root, a, sep = ""))
  # 
  # make a list of the files in the directory, not including the folders
  files = Sys.glob("*.*")
  # 
  # system call - move the first 100 files on the file list into the folder
  for (i in files[1:files.per.dir]) {
    system(paste("mv", i, paste(dir.root, a, sep = ""), sep = " "))
  }
  # 
  # counter + 1
  a = a + 1
  # TODO - system call - zip all the directories in the top dir
}
# 
# Dealing with the leftovers:
system(paste("mkdir ", dir.root, a, sep = ""))
files = Sys.glob("*.*")
for (i in files[1:length(files)]) {
  system(paste("mv", i, paste(dir.root, a, sep = ""), sep = " "))
}
