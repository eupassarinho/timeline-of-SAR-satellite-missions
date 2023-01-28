library(ggplot2)

df <- data.frame(ano = seq(from = 1976, to = 2020, by = 1))

ggplot(df)+
  xlim(1976, 2023)+
  ylim(0, 46)+
  labs(title = "Radar Satellite Timeline",
       subtitle = "By Erli Pinto dos Santos, january 2020, adapted from EO College's Echoes in Space course: https://eo-college.org/",
       caption = "Probable mission launch date time according to: * CONAE; ** Microwave Radar Institute   ")+
  geom_vline(xintercept = 2020, mapping = aes(colour = "black"))+
  annotate("text", x = 2020, y = 44,
           label = "This chart was made
           in current time")+
  geom_segment(mapping = aes(x = 1978-0.1, xend = 1978+0.1,
                             y = 44, yend = 44),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 1976, y = 44, label = "SEASAT",
           family = "sans")+
  geom_segment(mapping = aes(x = 1981-0.1, xend = 1981+0.1,
                             y = 42, yend = 42),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 1979, y = 42, label = "SIR-A",
           family = "sans")+
  geom_segment(mapping = aes(x = 1984-0.1, xend = 1984+0.1,
                             y = 40, yend = 40),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 1982, y = 40, label = "SIR-B",
           family = "sans")+
  geom_segment(mapping = aes(x = 1994-0.1, xend = 1994+0.1,
                             y = 38, yend = 38),
               size = 6, colour = "purple",
               lineend = "round")+
  annotate("text", x = 1991, y = 38, label = "SIR-C/X-SAR",
           family = "sans")+
  geom_segment(mapping = aes(x = 2000-0.1, xend = 2000+0.1,
                             y = 36, yend = 36),
               size = 6, colour = "purple",
               lineend = "round")+
  annotate("text", x = 1998, y = 36, label = "SRTM",
           family = "sans")+
  geom_segment(mapping = aes(x = 1991, xend = 2000,
                             y = 34, yend = 34),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 1989, y = 34, label = "ERS-1",
           family = "sans")+
  geom_segment(mapping = aes(x = 1995, xend = 2011,
                             y = 32, yend = 32),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 1993, y = 32, label = "ERS-2",
           family = "sans")+
  geom_segment(mapping = aes(x = 2002, xend = 2012,
                             y = 30, yend = 30),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 1999, y = 30, label = "ENVISAT",
           family = "sans")+
  geom_segment(mapping = aes(x = 2014, xend = 2020,
                             y = 28, yend = 28),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 2011, y = 28, label = "Sentinel-1A",
           family = "sans")+
  geom_segment(mapping = aes(x = 2016, xend = 2020,
                             y = 26, yend = 26),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 2013, y = 26, label = "Sentinel-1B",
           family = "sans")+
  geom_segment(mapping = aes(x = 1992, xend = 1998,
                             y = 24, yend = 24),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 1990, y = 24, label = "JERS-1",
           family = "sans")+
  geom_segment(mapping = aes(x = 2006, xend = 2011,
                             y = 22, yend = 22),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 2004, y = 22, label = "ALOS-1",
           family = "sans")+
  geom_segment(mapping = aes(x = 2014, xend = 2020,
                             y = 20, yend = 20),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 2012, y = 20, label = "ALOS-2",
           family = "sans")+
  geom_segment(mapping = aes(x = 1995, xend = 2013,
                             y = 18, yend = 18),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 1992, y = 18, label = "RADARSAT-1",
           family = "sans")+
  geom_segment(mapping = aes(x = 2007, xend = 2020,
                             y = 16, yend = 16),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 2004,y = 16, label = "RADARSAT-2",
           family = "sans")+
  geom_segment(mapping = aes(x = 2007, xend = 2020,
                             y = 14, yend = 14),
               size = 6, colour = "red",
               lineend = "round")+
  annotate("text", x = 2004, y = 14, label = "TerraSAR-X",
           family = "sans")+
  geom_segment(mapping = aes(x = 2010, xend = 2017,
                             y = 12, yend = 12),
               size = 6, colour = "red",
               lineend = "round")+
  annotate("text", x = 2007, y = 12, label = "TanDEM-X",
           family = "sans")+
  geom_segment(mapping = aes(x = 2007, xend = 2020,
                             y = 10, yend = 10),
               size = 6, colour = "red",
               lineend = "round")+
  annotate("text", x = 2003, y = 10, label = "COSMO-Skymed",
           family = "sans")+
  geom_segment(mapping = aes(x = 2018, xend = 2020,
                           y = 8, yend = 8),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 2015, y = 8, label = "SAOCOM 1A",
           family = "sans")+
  geom_segment(mapping = aes(x = 2020-0.1, xend = 2020+0.1,
                             y = 6, yend = 6),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 2017, y = 6, label = "SAOCOM 1B*",
           family = "sans")+
  geom_segment(mapping = aes(x = 2022-0.1, xend = 2022+0.1,
                             y = 4, yend = 4),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 2019, y = 4, label = "Tandem-L**",
           family = "sans")+
  geom_segment(mapping = aes(x = 2018, xend = 2020,
                             y = 2, yend = 2),
               size = 6, colour = "red",
               lineend = "round")+
  annotate("text", x = 2016, y = 2, label = "SEOSAR",
           family = "sans")+
  geom_segment(mapping = aes(x = 1978, xend = 1980,
                             y = 4, yend = 4),
               size = 6, colour = "orangered",
               lineend = "round")+
  annotate("text", x = 1982, y = 4, label = "L-Band",
           family = "sans")+
  geom_segment(mapping = aes(x = 1978, xend = 1980,
                             y = 6, yend = 6),
               size = 6, colour = "orange",
               lineend = "round")+
  annotate("text", x = 1982, y = 6, label = "C-Band",
           family = "sans")+
  geom_segment(mapping = aes(x = 1978, xend = 1980,
                             y = 2, yend = 2),
               size = 6, colour = "red",
               lineend = "round")+
  annotate("text", x = 1982, y = 2, label = "X-Band",
           family = "sans")+
  geom_segment(mapping = aes(x = 1978, xend = 1980,
                             y = 0, yend = 0),
               size = 6, colour = "purple",
               lineend = "round")+
  annotate("text", x = 1983.5, y = 0, label = "L, C and X-Band",
           family = "sans")+
  theme(axis.title = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.text.x = element_text(size = 12, family = "sans"),
        axis.line.x = element_line(color = "black",
                                   size = 1,
                                   arrow = arrow(angle = 15,
                                                 length = unit(5, "mm"),
                                                 type = "closed")),
        panel.background = element_rect(fill = "white"),
        plot.background = element_rect(fill = "snow1"),
        plot.margin = unit(x = c(0.5, 0, 0.2, 0), units = 'cm'),
        plot.title = element_text(face = "bold", hjust = 0.01),
        plot.subtitle = element_text(face = "italic", hjust = 0.01))
  
ggsave("C:/Users/Erli/Downloads/radarTimeline.png",
       width = 280, height = 180, units = "mm",
       dpi = 500)
