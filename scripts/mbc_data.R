# reads in microbial biomass data and metadata and writes out .rds

# Author: Itamar Shabtai
# Version: 2020-01-26

# Libraries
library(tidyverse)
library(here)

# Parameters
  # input_file
mbc_raw_data <- here("data-raw/mbc_data.csv")
  
  # output_file
mbc_out_data <- here("data/mbc_data.rds")
# ============================================================================

mbc_data <- 
  read_csv("data-raw/mbc_data.csv", 
           col_types = cols(treatment = col_factor(levels = c("Ca","DW")), 
                            litter = col_factor(levels = c("n","y"), ordered = FALSE), 
                            water_content = col_factor(levels = c("low", "high", "non-incubated")),
                            day = col_factor(levels = c("Initial", "Beginning", "End")))) %>% 
  filter(jar_ID != 28 & jar_ID != 39 & jar_ID != 46 & jar_ID != 44) %>% 
  write_rds(mbc_out_data)

