#Script to write a table of samples in each pool of library preparation (Next Generation Sequencing)
#with the minimum value of Median Target Coverage by pool


#Load Libraries
library(dplyr)

#Load data table containing metrics generated with Picard CollectHsMetrics
#This table contains columns called MEDIAN_TARGET_COVERAGE and PCT_TARGET_BASES_50x
#Samples belong to different Pools as specified by the 'Pool' variable = column.
pool_data <- read.table('AllSamples_TargetCoverage.txt', header=TRUE)

#Identify the samples in each pool that have the minimum value of MEDIAN_TARGET_COVERAGE'
pool_data_minCoverage<- pool_data %>%
  group_by(Pool) %>%
  slice (which.min(MEDIAN_TARGET_COVERAGE))

write.table(pool_data_minCoverage, 'ByPool_Minimum_MedianTargetCoverage.txt', row.names= FALSE, sep ='\t', quote=FALSE)
