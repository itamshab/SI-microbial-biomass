2020-11-30

  - [K2SO4 0.05 M Extractable DOC](#k2so4-0.05-m-extractable-doc)
  - [Microbial biomass C](#microbial-biomass-c)
  - [Extracted and fumigated C](#extracted-and-fumigated-c)

## K2SO4 0.05 M Extractable DOC

![](mbc_files/figure-gfm/DOC-1.png)<!-- -->

    ##                                Df Sum Sq Mean Sq F value   Pr(>F)    
    ## treatment                       1 0.0001 0.00014   0.019    0.892    
    ## water_content                   2 0.0165 0.00827   1.081    0.344    
    ## litter                          1 0.2383 0.23832  31.157 2.78e-07 ***
    ## treatment:water_content         2 0.0171 0.00857   1.121    0.331    
    ## treatment:litter                1 0.0001 0.00015   0.019    0.889    
    ## water_content:litter            1 0.0114 0.01144   1.496    0.225    
    ## treatment:water_content:litter  1 0.0000 0.00003   0.004    0.947    
    ## Residuals                      85 0.6502 0.00765                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    ##                                Df Sum Sq Mean Sq F value  Pr(>F)    
    ## treatment                       1 0.0087  0.0087   5.258 0.02796 *  
    ## water_content                   1 0.0175  0.0175  10.623 0.00249 ** 
    ## litter                          1 0.4238  0.4238 257.254 < 2e-16 ***
    ## treatment:water_content         1 0.0004  0.0004   0.238 0.62856    
    ## treatment:litter                1 0.0000  0.0000   0.001 0.97118    
    ## water_content:litter            1 0.0241  0.0241  14.609 0.00052 ***
    ## treatment:water_content:litter  1 0.0001  0.0001   0.052 0.82166    
    ## Residuals                      35 0.0577  0.0016                    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    ##                                Df   Sum Sq  Mean Sq F value   Pr(>F)    
    ## treatment                       1 0.000312 0.000312   6.322   0.0163 *  
    ## water_content                   1 0.001437 0.001437  29.140 3.81e-06 ***
    ## litter                          1 0.003588 0.003588  72.776 2.32e-10 ***
    ## treatment:water_content         1 0.001255 0.001255  25.449 1.15e-05 ***
    ## treatment:litter                1 0.000032 0.000032   0.643   0.4276    
    ## water_content:litter            1 0.000076 0.000076   1.546   0.2213    
    ## treatment:water_content:litter  1 0.000114 0.000114   2.312   0.1367    
    ## Residuals                      38 0.001874 0.000049                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

1.  DOC was higher at the beginning than at the end of the incubation
    when litter was added, probably as a result of litter decomposition.
    When no litter was added, DOC was similar at the beginning and end
    of the incubation.

2.  Ca preincubation increased the early stage DOC concentration
    relative to the DW preincubation, except for the low water
    content+litter treatment. Perhaps because the water content was not
    high enough to sustain the amount of activity the led to the
    decrease in DOC. This is surprising, as Ca is thought to involve
    binding of DOC to minerals and reduce its availability. Here, Ca may
    have mediated microbial activity (?)

3.  At the end of the experiment DOC did not differ between water
    contents or preincubation treatment for the litter (\~0.4 mg C/g
    soil) and no litter (\~0.3 mg C/g soil).

4.  In the non-incubated controls, Ca preincubation treatment decreased
    DOC concentration compared to preincubation with DW. This could
    suggest the hypothesized role of Ca in DOC binding. Even though, DOC
    in the incubated soil was often higher in the soils preincubated
    with Ca, dominating over DOC binding by Ca. It may even be the case
    that had this not been the case the differences in DOC between DW
    and Ca were higher. On the other hand, it could be the result of the
    preincubating process itself. Ca-soils had to be leached many more
    times to achieve the same EC, and perhaps more C was washed out as
    well.

## Microbial biomass C

    ## Warning: Removed 3 rows containing non-finite values (stat_boxplot).

    ## Warning: Removed 3 rows containing missing values (geom_point).

![](mbc_files/figure-gfm/MBC-1.png)<!-- -->

    ##                                Df Sum Sq Mean Sq F value   Pr(>F)    
    ## treatment                       1 0.0054  0.0054   0.211 0.647549    
    ## water_content                   2 0.4772  0.2386   9.385 0.000214 ***
    ## litter                          1 0.7532  0.7532  29.624 5.33e-07 ***
    ## treatment:water_content         2 0.0857  0.0428   1.684 0.191908    
    ## treatment:litter                1 0.0239  0.0239   0.941 0.334780    
    ## water_content:litter            1 0.0013  0.0013   0.050 0.823825    
    ## treatment:water_content:litter  1 0.0943  0.0943   3.711 0.057524 .  
    ## Residuals                      82 2.0848  0.0254                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 3 observations deleted due to missingness

    ##                                Df Sum Sq Mean Sq F value   Pr(>F)    
    ## treatment                       1 0.0271  0.0271   0.785   0.3819    
    ## water_content                   1 0.0623  0.0623   1.802   0.1884    
    ## litter                          1 0.7622  0.7622  22.055 4.24e-05 ***
    ## treatment:water_content         1 0.1867  0.1867   5.403   0.0262 *  
    ## treatment:litter                1 0.0007  0.0007   0.019   0.8911    
    ## water_content:litter            1 0.0101  0.0101   0.292   0.5925    
    ## treatment:water_content:litter  1 0.2496  0.2496   7.222   0.0111 *  
    ## Residuals                      34 1.1751  0.0346                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 1 observation deleted due to missingness

    ##                                Df Sum Sq Mean Sq F value   Pr(>F)    
    ## treatment                       1 0.0357 0.03566   3.880 0.056588 .  
    ## water_content                   1 0.0967 0.09672  10.524 0.002545 ** 
    ## litter                          1 0.1378 0.13781  14.996 0.000437 ***
    ## treatment:water_content         1 0.0104 0.01037   1.128 0.295261    
    ## treatment:litter                1 0.0253 0.02531   2.754 0.105713    
    ## water_content:litter            1 0.0014 0.00143   0.156 0.695078    
    ## treatment:water_content:litter  1 0.0023 0.00228   0.248 0.621448    
    ## Residuals                      36 0.3308 0.00919                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 2 observations deleted due to missingness

1.  When no litter was added, MBC was higher at the end of the
    incubation that at the beginning increased with DW preincubaion, but
    was not different with Ca preincubation. Thus, MBC was somewhat
    higher with Ca than with DW at the beginning. MBC could have
    increased with time as more SOC was decomposed and made available.
    With CA MBC was as high at the beginning of the incubation as it was
    in the end.

2.  When litter was added at higher water content, early stage MBC in
    the Ca preincubated soils was higher than with DW, and then evened
    out. At lower water content, no differences in MBC were detected.
    The lack of difference in MBC and DOC in the +litter/low water
    content treatment may be the result of a lack of water to sustain
    the elevated microbial activity achieved when preincubated with Ca
    at higher water content.

3.  MBC of Ca preincubated but non-incubated soils was lower than that
    of DW. Is this the result of lower extraction efficiency in the
    presence of elevated Ca, or did the more intensive leaching of
    Ca-preincubated soils remove more dissolved C and nutrients needed
    to sustain microbial growth.

## Extracted and fumigated C

    ## Warning: Removed 3 rows containing non-finite values (stat_boxplot).

    ## Warning: Removed 3 rows containing missing values (geom_point).

![](mbc_files/figure-gfm/fumigated-1.png)<!-- -->
