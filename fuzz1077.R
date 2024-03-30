# Load necessary packages for Fuzzy C-Means
install.packages("e1071")
library(e1071)

# Read your CSV data (replace with your actual file path)
df <- read.csv("C:\\Users\\subasinikesavan\\OneDrive\\Documents\\ass\\Data Mining\\Mall_Customers.csv")

# Remove any rows with missing values
df <- na.omit(df)

# Select columns for clustering
selected_data <- df[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Perform Fuzzy C-Means clustering
k <- 3
fcm_res <- cmeans(selected_data, centers = k, iter.max = 100, dist = "euclidean", m = 2)

# Add cluster assignments to the original dataset
df$Cluster <- max.col(fcm_res$membership)

# Print the cluster assignments
print(df)

# Load necessary packages for plotting

library(ggplot2)

# Assuming you have already performed FCM clustering and assigned cluster labels to your dataset
# df$Cluster <- max.col(fcm_res$membership)

# Create a scatter plot
ggplot(df, aes(x = Annual.Income..k.., y = Spending.Score..1.100., color = factor(Cluster))) +
  geom_point() +
  labs(title = "Fuzzy C-Means Clustering",
       x = "Annual Income (k$)",
       y = "Spending Score (1-100)")
