library(readr) 
library(dplyr)
library(ggplot2)

# Function to read and combine CVS files
readCSVs = function (path) {
  list.files(path, full.names = TRUE) %>% lapply(read_csv, skip=1, col_names=FALSE) %>% bind_rows(); 
}

#sncb = readCSVs("/home/julian/Desktop/results/nmbs/no_cache")
#sncb_cache = readCSVs("/home/julian/Desktop/results/nmbs/cache")
#delijn = readCSVs("/home/julian/Desktop/results/delijn/no_cache")
#delijn_cache = readCSVs("/home/julian/Desktop/results/delijn/cache")
#tbs = readCSVs("/home/julian/Desktop/results/tbs-barcelona/no_cache")
#tbs_cache = readCSVs("/home/julian/Desktop/results/tbs-barcelona/cache")
#tbx = readCSVs("/home/julian/Desktop/results/tbx-barcelona/no_cache")
tbx_cache = readCSVs("/home/julian/Desktop/results/tbx-barcelona/cache")

ggplot(tbx_cache, aes(x=as.factor(X2), y=X4)) + geom_violin(scale = "width") + stat_summary(fun.y=median, geom="point", size=2, color="red") + ggtitle("TBX Barcelona Fragmentations with cache") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Fragmentation (bytes)") + ylab("Response Time (ms)")