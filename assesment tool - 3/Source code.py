# CASE STUDY
# Budget Limitations and Computing Resource Availability
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# Generate Dataset
np.random.seed(42)

project_id = np.arange(1, 21)

budget = np.random.randint(5000, 50000, 20)
cpu = np.random.randint(2, 64, 20)
memory = np.random.randint(4, 128, 20)
storage = np.random.randint(100, 2000, 20)

performance = (
    budget/1000 +
    cpu*0.8 +
    memory*0.25 +
    storage*0.01 +
    np.random.normal(0,5,20)
)

df = pd.DataFrame({
    "Project ID": project_id,
    "Budget ($)": budget,
    "CPU Cores": cpu,
    "Memory (GB)": memory,
    "Storage (GB)": storage,
    "Performance Score": performance.round(2)
})


# Display Dataset

print("="*70)
print("CASE STUDY DATASET")
print("="*70)

print(df)

# Summary Statistics

print("\n")
print("="*70)
print("SUMMARY STATISTICS")
print("="*70)

print(df.describe())

# Correlation Matrix

print("\n")
print("="*70)
print("CORRELATION MATRIX")
print("="*70)

print(df.corr(numeric_only=True))
# GRAPH 1
# Budget vs Performance
plt.figure(figsize=(8,5))

colors = plt.cm.tab20(np.arange(20))

plt.scatter(df["Budget ($)"],
            df["Performance Score"],
            c=colors,
            s=180,
            edgecolors="black")

plt.title("Budget vs Performance",fontsize=15,fontweight='bold')
plt.xlabel("Budget ($)")
plt.ylabel("Performance Score")
plt.grid(True)

plt.show()
# GRAPH 2
# CPU Availability
plt.figure(figsize=(10,5))

plt.bar(df["Project ID"],
        df["CPU Cores"],
        color=plt.cm.Set3(np.linspace(0,1,20)))

plt.title("CPU Resource Availability",fontsize=15,fontweight='bold')
plt.xlabel("Project ID")
plt.ylabel("CPU Cores")

plt.xticks(project_id)

plt.show()
# GRAPH 3
# Memory Availability
plt.figure(figsize=(10,5))

plt.bar(df["Project ID"],
        df["Memory (GB)"],
        color=plt.cm.rainbow(np.linspace(0,1,20)))

plt.title("Memory Availability",fontsize=15,fontweight='bold')
plt.xlabel("Project ID")
plt.ylabel("Memory (GB)")

plt.xticks(project_id)

plt.show()
# GRAPH 4
# Storage Availability
plt.figure(figsize=(10,5))

plt.bar(df["Project ID"],
        df["Storage (GB)"],
        color=plt.cm.Paired(np.linspace(0,1,20)))

plt.title("Storage Availability",fontsize=15,fontweight='bold')
plt.xlabel("Project ID")
plt.ylabel("Storage (GB)")

plt.xticks(project_id)

plt.show()
# GRAPH 5
# Budget Distribution
plt.figure(figsize=(8,5))

n,bins,patches = plt.hist(df["Budget ($)"],
                          bins=6,
                          edgecolor='black')

colors = plt.cm.viridis(np.linspace(0,1,len(patches)))

for color,patch in zip(colors,patches):
    patch.set_facecolor(color)

plt.title("Budget Distribution",fontsize=15,fontweight='bold')
plt.xlabel("Budget ($)")
plt.ylabel("Frequency")

plt.show()
# GRAPH 6
# Performance Ranking
sorted_df = df.sort_values("Performance Score",ascending=False)

plt.figure(figsize=(10,5))

plt.plot(sorted_df["Project ID"],
         sorted_df["Performance Score"],
         color='purple',
         linewidth=3,
         marker='o',
         markersize=8,
         markerfacecolor='orange',
         markeredgecolor='black')

plt.title("Performance Ranking",fontsize=15,fontweight='bold')
plt.xlabel("Project ID")
plt.ylabel("Performance Score")

plt.xticks(sorted_df["Project ID"])

plt.grid(True)

plt.show()
# GRAPH 7
# Comparison of Resources
x=np.arange(len(df))
width=0.25

plt.figure(figsize=(12,6))

plt.bar(x-width,
        df["CPU Cores"],
        width,
        label="CPU",
        color='royalblue')

plt.bar(x,
        df["Memory (GB)"],
        width,
        label="Memory",
        color='green')

plt.bar(x+width,
        df["Storage (GB)"]/20,
        width,
        label="Storage/20",
        color='red')

plt.xticks(x,df["Project ID"])

plt.title("Comparison of Computing Resources",fontsize=15,fontweight='bold')
plt.xlabel("Project ID")
plt.ylabel("Resource Value")

plt.legend()

plt.show()
# FINAL SUMMARY
best=df.loc[df["Performance Score"].idxmax()]
worst=df.loc[df["Performance Score"].idxmin()]

print("\n")
print("="*70)
print("CASE STUDY SUMMARY")
print("="*70)

print(f"Total Projects            : {len(df)}")
print(f"Average Budget            : ${df['Budget ($)'].mean():.2f}")
print(f"Average CPU Cores         : {df['CPU Cores'].mean():.2f}")
print(f"Average Memory            : {df['Memory (GB)'].mean():.2f} GB")
print(f"Average Storage           : {df['Storage (GB)'].mean():.2f} GB")
print(f"Average Performance Score : {df['Performance Score'].mean():.2f}")

print("\nBest Performing Project")
print(best)

print("\nLowest Performing Project")
print(worst)

print("\nCONCLUSION")
print("• Higher budgets generally provide better computing resources.")
print("• More CPU, memory, and storage improve system performance.")
print("• Limited budgets reduce computing resource availability.")
print("• Efficient resource allocation can improve performance even with budget constraints.")
