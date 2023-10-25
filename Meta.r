if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("MathiasHarrer/dmetar")

install.packages("tidyverse")

library(dmetar)
library(tidyverse)
library(meta)

data(HealthWellbeing)

# Correlation

m.cor <- metacor(cor = cor, 
                 n = n,
                 studlab = author,
                 data = HealthWellbeing,
                 fixed = FALSE,
                 random = TRUE,
                 method.tau = "REML",
                 hakn = TRUE,
                 prediction = TRUE,
                 title = "Health and Wellbeing")
summary(m.cor)

# Forest Plot

forest.meta(m.cor, 
            sortvar = TE,
            prediction = TRUE, 
            print.tau2 = FALSE,
            leftlabs = c("Author", "g", "SE"))


# Funnel Plot

# Produce funnel plot
funnel.meta(m.cor,
            xlim = c(-0.5, 2),
            studlab = TRUE)

# Add title
title("Funnel Plot (Third Wave Psychotherapies)")

