
#Rscript --vanilla sform.R x y z ID

args <- commandArgs(trailingOnly = TRUE)

new.mm.x <- args[1]
new.mm.y <- args[2]
new.mm.z <- args[3]

SFORM <- paste(as.character(args[4]), "_orig_sform.txt", sep = "")
sform.orig <- read.delim(SFORM, sep = " ", header = FALSE)

sform.orig <- as.matrix(sform.orig)
sform.new <- sform.orig
new.origin <- c(new.mm.x, new.mm.y, new.mm.z, 0)

sform.new[,4] <- sform.new[,4] - new.origin

cat(t(sform.new))

#without command line
# sform.orig <- read_delim('HAR31503_orig_sform.txt', " ", col_names = FALSE)
# new.vxl.x <- 88
# new.vxl.y <- 139
# new.vxl.z <- 142
# new.origin <- c(new.vxl.x, new.vxl.y, new.vxl.z, 1)
# 
# sform.orig <- as.matrix(sform.orig)
# sform.mm <- sform.orig %*% new.origin
# sform.mm <- t(sform.mm)
# 
# sform.orig[,4] <- sform.orig[,4]-sform.mm

# new.mm.x <- 5.676262
# new.mm.y <- 15.9422
# new.mm.z <- 7.52367
# sform.orig <- as.matrix(sform.orig)
# sform.new <- sform.orig
# sform.new[1,4] <- new.mm.x
# sform.new[2,4] <- new.mm.y
# sform.new[3,4] <- new.mm.z
# 
# c(t(sform.new))
