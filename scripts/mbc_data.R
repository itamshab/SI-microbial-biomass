# reads in microbial biomass data and metadata and writes out .rds

# Author: Itamar Shabtai
# Version: 2020-01-26

# Libraries
library(tidyverse)
library(here)

# Parameters
  # input_file
file_raw_data <- here("data-raw/mbc_aata.csv")
  
  # output_file
file_out_data <- here("data/mbc_data.rds")
# ============================================================================

file_raw_data <- 
  read_csv(here("data-raw/mbc_data.csv")) %>% 
  filter(jar_ID != 28 & jar_ID != 39 & jar_ID != 46 & jar_ID != 44)

write_rds(file_raw_data, file_out_data)
