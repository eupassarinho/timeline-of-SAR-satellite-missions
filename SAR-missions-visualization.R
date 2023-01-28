library(readxl)
library(esquisse)
library(ggplot2)
library(dplyr)
library(showtext)
library(lubridate)

# Importing data ----------------------------------------------------------
# Importing .xlsx Excel sheet containing SAR satellite mission infos
SAR_Missions <- read_excel("SAR_Missions.xlsx", 
                           col_types = c("numeric", "text", "text", 
                                         "text", "numeric", "text", "text", 
                                         "text", "text", "text", "numeric", "numeric", 
                                         "numeric")) %>% 
  mutate(`End of operation` = ifelse(is.na(`End of operation`) & Launch > 2023,
                                     Launch, ifelse(is.na(`End of operation`),
                                                    year(Sys.Date()),
                                                    `End of operation`)))

## Exploring dataset
SAR_Missions %>% names()
SAR_Missions %>% str()

# Customizating font family -----------------------------------------------
## Searching in Google Fonts for a typography
## In this case for the "Oswald" font family
font_add_google("Oswald")
## Enabling R to use the found fonts
showtext_auto(record = TRUE)
## Enabling R to export the found fonts, setting a resolution
showtext_opts(dpi = 800)

# Data viz ----------------------------------------------------------------

# Mission frequency chart -------------------------------------------------

sar_time_and_freqency <- ggplot(SAR_Missions)+
  # Geometry to generate timelines
  geom_segment(aes(x = Launch,
                   xend = ifelse(`End of operation` - Launch == 0,
                                 `End of operation` + 0.1,
                                 `End of operation`),
                   y = N, yend = N,
                   colour = Frequency),
               size = 5, lineend = "round")+
  # Setting manually the segment colours
  scale_colour_manual(values = c("#EBF20C", "#919191", "#FFA200",
                                 "#810752", "#404040", "#000000",
                                 "#3D004D"))+
  # Geometry indicating the time when chart was made
  geom_vline(xintercept = 2023, size = 1, colour = "black")+
  # Eliminate any gridlines in y axis
  scale_y_continuous(breaks = NULL)+
  # Draw, in a time period, gridlines for x axis
  scale_x_continuous(minor_breaks = seq(1975, 2030))+
  # Annotating past and present SAR missions
  geom_text(aes(x = Launch - 1, y = N, label = Mission, hjust = 1),
            data = SAR_Missions %>% filter(Launch <= 2021),
            family = "serif", size = 16/.pt)+
  # Annotating planned SAR missions
  geom_text(aes(x = Launch + 1, y = N, label = Mission, hjust = 0),
            data = SAR_Missions %>% filter(Launch > 2021),
            family = "serif", size = 16/.pt)+
  # Indicating year when the chart was made
  annotate(geom = "text", x = 2023, y = 1,
           label = expression(atop("Current time:", "2023 yr")),
           hjust = 0, family = "serif", size = 12/.pt)+
  # x axis label title
  xlab("Mission operation time/Planned datetime launch")+
  # Plot tittle
  ggtitle(label = "Time series of radar satellite missions",
          subtitle = "Mainly Synthetic Aperture Radar (SAR) missions")+
  # Adding authorship as a caption
  labs(caption = "Erli Pinto dos Santos")+
  # General chart theme
  theme_minimal()+
  # Specifications on the theme of the chart
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(),
        axis.ticks.y = element_blank(), axis.line.y = element_blank(),
        legend.position = c(0.1, 0.8), legend.background = element_blank(),
        text = element_text(family = "Oswald", face = "bold", size = 18))+
  # Setting coordinate system for the chart
  coord_cartesian(xlim = c(1975, 2030))

ggsave("SAR_missions_and_frequency.png", plot = sar_time_and_freqency,
       width = 30, height = 30, units = "cm",
       dpi = 800,
       bg = "#FFFFFF" # White as plot background color 
       )

# Mission polarizations chart ---------------------------------------------

sar_time_and_polarizations <- ggplot(SAR_Missions)+
  # Geometry to generate timelines
  geom_segment(aes(x = Launch,
                   xend = ifelse(`End of operation` - Launch == 0,
                                 `End of operation` + 0.1,
                                 `End of operation`),
                   y = N, yend = N,
                   colour = Polarization),
               size = 5, lineend = "round")+
  # Setting manually the segment colours
  scale_colour_manual(values = c("#367FBF", "#0C2659", "#552D8D",
                                 "#919191", "#404040", "#000000"))+
  # Geometry indicating the time when chart was made
  geom_vline(xintercept = 2023, size = 1, colour = "black")+
  # Eliminate any gridlines in y axis
  scale_y_continuous(breaks = NULL)+
  # Draw, in a time period, gridlines for x axis
  scale_x_continuous(minor_breaks = seq(1975, 2030))+
  # Annotating past and present SAR missions
  geom_text(aes(x = Launch - 1, y = N, label = Mission, hjust = 1),
            data = SAR_Missions %>% filter(Launch <= 2021),
            family = "serif", size = 16/.pt)+
  # Annotating planned SAR missions
  geom_text(aes(x = Launch + 1, y = N, label = Mission, hjust = 0),
            data = SAR_Missions %>% filter(Launch > 2021),
            family = "serif", size = 16/.pt)+
  # Indicating year when the chart was made
  annotate(geom = "text", x = 2023, y = 1,
           label = expression(atop("Current time:", "2023 yr")),
           hjust = 0.5, family = "serif", size = 12/.pt)+
  # x axis label title
  xlab("Mission operation time/Planned datetime launch")+
  # Plot tittle
  ggtitle(label = "Time series of radar satellite missions",
          subtitle = "Mainly Synthetic Aperture Radar (SAR) missions")+
  # Adding authorship as a caption
  labs(caption = "Erli Pinto dos Santos")+
  # General chart theme
  theme_minimal()+
  # Specifications on the theme of the chart
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(),
        axis.ticks.y = element_blank(), axis.line.y = element_blank(),
        legend.position = c(0.3, 0.8), legend.background = element_blank(),
        text = element_text(family = "Oswald", face = "bold", size = 18))+
  # Setting coordinate system for the chart
  coord_cartesian(xlim = c(1975, 2030))

ggsave("SAR_missions_and_polarization.png", plot = sar_time_and_polarizations,
       width = 30, height = 30, units = "cm",
       dpi = 800,
       bg = "#FFFFFF" # White as plot background color 
       )
