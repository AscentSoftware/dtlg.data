#
# Slightly adapted from https://github.com/Max-Ebenezer-Brown/dtlg_data.
#

library(dplyr)
library(readr)
library(dtlg.data)
library(random.cdisc.data)

seed <- 42

adsl_small <- random.cdisc.data::radsl(N = 20000, seed = seed)
adsl_large <- random.cdisc.data::radsl(N = 1000000, seed = seed)
adae <- random.cdisc.data::radae(adsl_small, 10L, seed = seed) # Slow
adae <- rbind(adae, adae, adae, adae, adae, adae, adae, adae, adae)

set.seed(seed = seed)

adae <-
  adae |>
  mutate(
    AEDECOD = dtlg.data::with_label(as.character(AEDECOD), "Dictionary-Derived Term"),
    AESDTH = dtlg.data::with_label(
      sample(
        c("N", "Y"),
        size = nrow(adae),
        replace = TRUE,
        prob = c(0.99, 0.01)
      ),
      "Results in Death"
    ),
    AEACN = dtlg.data::with_label(
      sample(
        c(
          "DOSE NOT CHANGED",
          "DOSE INCREASED",
          "DRUG INTERRUPTED",
          "DRUG WITHDRAWN"
        ),
        size = nrow(adae),
        replace = TRUE,
        prob = c(0.68, 0.02, 0.25, 0.05)
      ),
      "Action Taken with Study Treatment"
    ),
    FATAL = dtlg.data::with_label(AESDTH == "Y", "AE with fatal outcome"),
    SEV = dtlg.data::with_label(AESEV == "SEVERE", "Severe AE (at greatest intensity)"),
    SER = dtlg.data::with_label(AESER == "Y", "Serious AE"),
    SERWD = dtlg.data::with_label(
      AESER == "Y" &
        AEACN == "DRUG WITHDRAWN",
      "Serious AE leading to withdrawal from treatment"
    ),
    SERDSM = dtlg.data::with_label(
      AESER == "Y" &
        AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      "Serious AE leading to dose modification/interruption"
    ),
    RELSER = dtlg.data::with_label(AESER == "Y" &
                                     AEREL == "Y", "Related Serious AE"),
    WD = dtlg.data::with_label(
      AEACN == "DRUG WITHDRAWN",
      "AE leading to withdrawal from treatment"
    ),
    DSM = dtlg.data::with_label(
      AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      "AE leading to dose modification/interruption"
    ),
    REL = dtlg.data::with_label(AEREL == "Y", "Related AE"),
    RELWD = dtlg.data::with_label(
      AEREL == "Y" &
        AEACN == "DRUG WITHDRAWN",
      "Related AE leading to withdrawal from treatment"
    ),
    RELDSM = dtlg.data::with_label(
      AEREL == "Y" &
        AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      "Related AE leading to dose modification/interruption"
    ),
    CTC35 = dtlg.data::with_label(AETOXGR %in% c("3", "4", "5"), "Grade 3-5 AE"),
    CTC45 = dtlg.data::with_label(AETOXGR %in% c("4", "5"), "Grade 4/5 AE"),
    USUBJID_AESEQ = paste(USUBJID, AESEQ, sep = "@@") # Create unique ID per AE in dataset.
  ) |>
  filter(ANL01FL == "Y")

#
# `datasets` tibble
#
adsl_large_desc <- "A large Subject-Level Analysis Dataset (ADSL)."
adsl_small_desc <- "A small Subject-Level Analysis Dataset (ADSL)."
adae_desc <- "A large Adverse Event Analysis Dataset derived from `adsl_small`."

datasets <- tibble::tribble(
  ~name,        ~nrow,            ~ncol,            ~description,
  "adsl_small", nrow(adsl_small), ncol(adsl_small), adsl_large_desc,
  "adsl_large", nrow(adsl_large), ncol(adsl_large), adsl_small_desc,
  "adae",       nrow(adae),       ncol(adae),       adae_desc
)

#
# Export
#
readr::write_rds(x = adsl_small, file = "inst/datasets/adsl_small.rds", compress = "xz")
readr::write_rds(x = adsl_large, file = "inst/datasets/adsl_large.rds", compress = "xz")
readr::write_rds(x = adae, file = "inst/datasets/adae.rds", compress = "xz")

usethis::use_data(datasets, overwrite = TRUE)
