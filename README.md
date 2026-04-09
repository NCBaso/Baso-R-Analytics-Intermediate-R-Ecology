# 🎓 Getting Started: Intermediate R for Ecology (swirl Course)

Welcome to the interactive portion of the **Intermediate R for Ecological Data Analysis** workshop! We use the `swirl` package to provide hands-on, real-time feedback as you learn.

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed:
1.  **R** (v4.0 or higher)
2.  **RStudio** (recommended)

## 🚀 Step-by-Step Instructions

### 1. Install Required Packages
Open RStudio and run the following commands in the Console to install the interactive learning environment:

```r
install.packages("swirl")
install.packages("tidyverse")
install.packages("vegan")
install.packages("patchwork")
install.packages("glmmTMB")
install.packages("performance")
install.packages("knitr")
```

### 2. Load the Course
Run this command to install the **Intermediate R Ecology** course directly from GitHub:

```r
library(swirl)

# Install the course from GitHub (Direct Link)
swirl::install_course_url("https://github.com/NCBaso/Baso-R-Analytics-Intermediate-R-Ecology/archive/refs/heads/main.zip")
```

### 3. Start Learning!
Whenever you want to practice, simply type:

```r
swirl()
```

Follow the prompts:
-   Select your name (or use a nickname).
-   Choose **"Intermediate R Ecology"** from the course menu.
-   Select your desired lesson.

## 📖 What You'll Learn

In this interactive session, you will practice:
*   **Advanced dplyr:** Merging species abundance data with environmental factors.
*   **Data Visualization:** Using ggplot2, faceting, and patchwork dashboards.
*   **Ecological Statistics:** Calculating diversity indices and multivariate patterns using vegan.
*   **GLMM Modeling:** Mixed-effects modeling and zero-inflation.

## 💡 Tips for swirl
-   **`bye()`**: To exit swirl and save your progress.
-   **`main()`**: To return to the main menu.
-   **`skip()`**: If you get stuck on a question and want to see the answer.
-   **`play()`**: If you want to experiment in the console without swirl evaluating your code. Type `nxt()` to return to the lesson.

---
*Happy Coding! 🌿📊*
