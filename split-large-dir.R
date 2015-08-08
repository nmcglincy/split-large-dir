# initiate counter
#
a = 1
# system call - make folder based on the counter
# 
system(paste("mkdir ", "russ-pics-", a, sep = ""))
# make a list of the files in the directory, not including the folders
# 
files = list.files(include.dirs = FALSE)
# system call - move the first 100 files on the file list into the folder
# 
for (i in files[1:100]) {
  system(paste("mv", i, paste("russ-pics-", a, sep = ""), sep = " "))
}
# counter + 1
#
a = a + 1
# loop back to beginning
# 
# system call - zip all the directories in the top dir