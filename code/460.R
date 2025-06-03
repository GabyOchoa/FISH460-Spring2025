
library(ggplot2)
library(tidyr)


#WEEK1
# Define your data directly
glucose_data <- data.frame(
  hours = c(1.25, 1.75, 2.25, 46.83, 47.33),
  Fasted_27C = c(19, 19, 19, 19, 19),
  Fed_27C = c(19, 19, 19, 19, 19),
  Fasted_13C = c(19, 19, 19, 19, 19),
  Fed_13C = c(19, 19, 19, 19, 22) 
)

# Convert from wide to long format for ggplot
long_data <- pivot_longer(glucose_data, 
                          cols = -hours, 
                          names_to = "Group", 
                          values_to = "Glucose")

# Make the plot
ggplot(long_data, aes(x = hours, y = Glucose, color = Group)) +
  annotate("rect", xmin = 0, xmax = 50, ymin = 0, ymax = 20,
           fill = "red", alpha = 0.15) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Glucose Levels Over Time",
       x = "Hours After Feeding",
       y = "Glucose (mg/dL)") +
  theme_minimal()






#WEEK2
# Define your data
glucose_data <- data.frame(
  hours = c(3.92, 4.42, 4.92, 5.42, 5.92),
  Fasted_27C = c(19, 19, 19, 19, 19),
  Fed_27C = c(19, 19, 19, 19, 19),
  Fasted_13C = c(19, 19, 19, 19, 19),
  Fed_13C = c(19, 19, 19, 19, 19)
)

# Convert to long format for ggplot
long_data_week2 <- pivot_longer(glucose_data, 
                          cols = -hours, 
                          names_to = "Group", 
                          values_to = "Glucose")

# Plot
ggplot(long_data_week2, aes(x = hours, y = Glucose, color = Group)) +
  annotate("rect", xmin = min(glucose_data$hours), xmax = max(glucose_data$hours),
           ymin = 0, ymax = 20, fill = "red", alpha = 0.15) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Glucose Levels After Feeding",
       x = "Hours After Feeding",
       y = "Glucose (mg/dL)") +
  theme_minimal()

############################


#week1-1
library(tidyverse)
# Define your data
glucose_data1 <- data.frame(
  hours = c(1.25, 1.75, 2.25, 46.83, 47.33),
  Fasted_27C = c(0.12949346, 0.00694444, 0.1621732, NA, 0.09068627),
  Fed_27C = c(0.2622549, 0.09681373, 0.06617647, NA, 0.11519608),
  Fasted_13C = c(0.0130719, 0.0375817, NA, 0.10702614, 0.07843137),
  Fed_13C = c(NA, 0.10498366, 0.18055556, NA, 0.31331699)
)

# Convert from wide to long format
long_data1 <- pivot_longer(glucose_data1,
                           cols = -hours,
                           names_to = "Group",
                           values_to = "Glucose")

# Remove rows with NA in Glucose
long_data1 <- long_data1 %>% filter(!is.na(Glucose))

# Make the plot (no annotation)
ggplot(long_data1, aes(x = hours, y = Glucose, color = Group, group = Group)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Glucose Levels Over Time",
       x = "Hours After Feeding",
       y = "Glucose (mg/dL)") +
  theme_minimal()

##MAYBE
ggplot(long_data1, aes(x = hours, y = Glucose, color = Group, group = Group)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  scale_x_log10(breaks = c(1, 2, 5, 10, 20, 50)) +  # customize breaks as needed
  labs(title = "Trial 1: Glucose Levels Over Time",
       x = "Hours After Feeding",
       y = "Glucose (mg/dL)") +
  theme_minimal()


#########
#week2
glucose_data2 <- data.frame(
  hours = c(3.92, 4.42, 4.92, 5.42, 5.92),
  Fasted_27C = c(NA, 0.14583333, 0.23978758, 0.05392157, 0.02941176),
  Fed_27C = c(0.04575163, NA, NA, NA, 0.26021242),
  Fasted_13C = c(0.10498366, NA, NA, NA, 0.03553922),
  Fed_13C = c(NA, 0.27859477, 0.31740196, 0.20506536, NA)
)

# Convert from wide to long format
long_data2 <- pivot_longer(glucose_data2,
                           cols = -hours,
                           names_to = "Group",
                           values_to = "Glucose")

# Remove rows with NA in Glucose
long_data2 <- long_data2 %>% filter(!is.na(Glucose))

# Make the plot (no annotation)
ggplot(long_data2, aes(x = hours, y = Glucose, color = Group, group = Group)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Trial 2: Glucose Levels Over Time",
       x = "Hours After Feeding",
       y = "Glucose (mg/dL)") +
  theme_minimal()

