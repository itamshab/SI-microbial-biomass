# reads in microbial biomass data and metadata and writes out .rds

# Author: Itamar Shabtai
# Version: 2020-01-26

# Libraries
library(tidyverse)
library(here)

# input_file

  mbc_raw_data <- here("data-raw/mbc_data.csv")
  mbc_isotope_data <- here("data-raw/microbial_biomass_isotope.csv")
  isotope_wide_data <- here("data-raw/microbial_biomass_isotope_wide.csv")
  co2_data_file <- (here("C:/Users/itama/OneDrive - Cornell University/Projects/research/SI-2/SI2-incubation/data/co2_mix_model_results.rds"))
  
# output_file

  mbc_out_data <- here("data/mbc_data.rds")
  mbc_isotope_out_data <- here("data/mbc_isotope_data.rds")
  mbc_isotope_wide_data <- here("data/mbc_isotope_wide.rds")
  mbc_isotope_wider_data <- here("data/mbc_isotope_wider.rds")

  mytheme <- theme_bw() + theme(panel.grid = element_blank()) + 
    theme(axis.text.x = element_text(size = 15)) +  
    theme(axis.text.y = element_text(size = 15)) +
    theme(axis.title.x = element_text(size = 15)) +
    theme(axis.title.y = element_text(size = 15)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_text(size = 15)) +
    theme(strip.text.x = element_text(size = 15))

# ============================================================================

# load data

  mbc_data <- 
    read_csv("data-raw/mbc_data.csv", 
             col_types = cols(Treatment = col_factor(levels = c("Ca","DW")), 
                              Litter = col_factor(levels = c("N","Y"), ordered = FALSE), 
                              Moisture = col_factor(levels = c("Low", "High", "non-incubated")),
                              Time =  col_factor(levels = c("Initial", "Beginning", "End")))) %>% 
    filter(jar_ID != 28 & jar_ID != 39 & jar_ID != 46 & jar_ID != 44) %>% 
    write_rds(mbc_out_data)

  co2_df <- read_rds(co2_data_file) 
  
  isotope_data <- 
    read_csv(mbc_isotope_data, 
             col_types = cols(Treatment = col_factor(levels = c("Ca","DW")), 
                              Litter = col_factor(levels = c("N","Y"), ordered = FALSE), 
                              Moisture = col_factor(levels = c("Low", "High", "non-incubated")),
                              Time = col_factor(levels = c("Pre-incubated", "Beginning", "End")))) %>% 
  
  write_rds(mbc_isotope_out_data)


  isotope_wide <-  
    read_csv(isotope_wide_data, 
             col_types = cols(Treatment = col_factor(levels = c("DW","Ca")), 
                              Litter = col_factor(levels = c("N","Y"), ordered = FALSE), 
                              Moisture = col_factor(levels = c("Low", "High", "non-incubated")),
                              Time = col_factor(levels = c("Pre-incubated", "Beginning", "End")))) %>%
    select(-c(1,17)) %>% 
    write_rds(mbc_isotope_wide_data)
  
  isotope_wider <- isotope_wide %>% 
    pivot_wider(names_from = Litter, 
                values_from = delta13_c_mbc, 
                id_cols = c(reps, Treatment, Moisture, Time),
                names_glue = "{.value}_{Litter}") %>% 
    mutate(frac_mbc_labeled = ((delta13_c_mbc_Y - delta13_c_mbc_N)/(718 - delta13_c_mbc_N))) %>% 
    rename(rep = reps) %>% 
    write_rds(mbc_isotope_wider_data)


  p_mbc_frac_litter <- 
    ggplot(filter(isotope_wider, Time != "Pre-incubated"), 
           aes(Moisture, frac_mbc_labeled, fill = Treatment)) +
    geom_boxplot() + 
    facet_wrap(. ~ Time) + 
    geom_point(aes(Moisture, frac_mbc_labeled, fill = Treatment), 
               position = position_jitterdodge(jitter.width = 0.1),
               shape = 21, size = 2) +
    labs(x = "Water content", y = "Fraction of MBC from plant litter") +
    mytheme +
    scale_fill_brewer(palette = "Set1")   

  p_mbc_frac_litter

  ggsave(filename = here("plots/mbc_fraction_litter.svg"), plot = p_mbc_frac_litter, width = 6, height = 4)

  aov_frac_litter_beg <- aov(frac_mbc_labeled ~ Treatment*Moisture, data = filter(isotope_wider, Time == "Beginning"))
  aov_frac_litter_end <- aov(frac_mbc_labeled ~ Treatment*Moisture, data = filter(isotope_wider, Time == "End"))
  
  summary.aov(aov_frac_litter_beg)
  summary.aov(aov_frac_litter_end)
  

# calculating mean MBC for the litter added samples 

  mbc_data_mean <- mbc_data %>% 
    filter(Litter == "Y") %>% 
    group_by(Moisture, Treatment, Time) %>%
    mutate(mean_MBC = mean(MBC_mg_g_soil, na.rm = TRUE)) %>% 
    distinct(mean_MBC, .keep_all = TRUE) %>% 
    select(!c(jar_ID, soil, rep, unfum_N_mg_g, fum_N_mg_g, MBN_mg_g_soil))


# joining tibble with MBC and tibble with mix model data

  mbc_final_mix_model_df <- 
    inner_join(isotope_wider, mbc_data_mean) %>% 
    mutate(MB13C = mean_MBC * frac_mbc_labeled) %>% 
    select(!Litter) 

  mbc_co2_final_mixing_model <- 
    inner_join(mbc_final_mix_model_df, co2_df) %>% 
    mutate(CUE = (MB13C / (MB13C + CO2_13_C)))
  

# plotting CUE
  
    p_cue <- ggplot(mbc_co2_final_mixing_model, aes(Moisture, CUE, fill = Treatment)) + 
    geom_boxplot() + 
    geom_point(aes(Moisture, CUE, fill = Treatment), 
               position = position_jitterdodge(jitter.width = 0.1),
               shape = 21, size = 2) +
    facet_wrap(. ~ Time) +
    mytheme +
    labs(x = "Water content", y = "Carbon use efficiency") +
    scale_fill_brewer(palette = "Set1")

  p_cue

  ggsave(filename = here("plots/cue_plot.svg"), plot = p_cue, width = 6, height = 4)

  
aov_cue <- aov(CUE ~ Treatment*Moisture*Time, data = mbc_co2_final_mixing_model)
anova(aov_cue)
