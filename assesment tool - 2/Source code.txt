# CASE STUDY:
# Energy-Efficient Battery Management for Electric Vehicles
# Using Optimal Policy Learning (Bellman Value Iteration)
import numpy as np
import matplotlib.pyplot as plt
# Battery States
states = ["100%", "80%", "60%", "40%", "20%"]

# Actions
actions = ["Eco", "Normal", "Sport"]

# Discount Factor
gamma = 0.90

iterations = 20

# Reward Matrix
# Different rewards for different battery levels


reward_matrix = {
    0: {"Eco":15, "Normal":10, "Sport":5},      #100%
    1: {"Eco":12, "Normal":8,  "Sport":2},      #80%
    2: {"Eco":9,  "Normal":5,  "Sport":-2},     #60%
    3: {"Eco":6,  "Normal":2,  "Sport":-5},     #40%
    4: {"Eco":3,  "Normal":-2, "Sport":-10}     #20%
}
# Initialize
V = np.zeros(len(states))
policy = [""] * len(states)
# Value Iteration
for i in range(iterations):

    new_V = np.copy(V)

    for s in range(len(states)):

        action_values = []

        for action in actions:

            next_state = min(s+1, len(states)-1)

            value = reward_matrix[s][action] + gamma * V[next_state]

            action_values.append(value)

        best = np.argmax(action_values)

        new_V[s] = action_values[best]

        policy[s] = actions[best]

    V = new_V
# OUTPUT
print("="*60)
print("ENERGY-EFFICIENT BATTERY MANAGEMENT USING OPTIMAL POLICY")
print("="*60)

print("\nBattery State Values\n")

for i in range(len(states)):
    print(f"{states[i]:>5} Battery  -->  {V[i]:.2f}")

print("\nOptimal Policy\n")

for i in range(len(states)):
    print(f"{states[i]:>5} Battery  -->  {policy[i]}")

# SUMMARY

print("\n")
print("="*60)
print("SUMMARY RESULT")
print("="*60)

print("Total Battery States :", len(states))
print("Iterations           :", iterations)
print("Average State Value  :", round(np.mean(V),2))
print("Maximum State Value  :", round(np.max(V),2))
print("Minimum State Value  :", round(np.min(V),2))
print("Optimal Action       :", "Eco Mode")

eco = policy.count("Eco")
normal = policy.count("Normal")
sport = policy.count("Sport")

print("\nPolicy Distribution")
print("--------------------------")
print("Eco Mode    :", eco)
print("Normal Mode :", normal)
print("Sport Mode  :", sport)

# GRAPH 1
# Battery Level vs State Value
plt.figure(figsize=(8,5))

colors = ["green","lime","gold","orange","red"]

plt.bar(states,V,color=colors)

plt.title("Battery Level vs State Value")

plt.xlabel("Battery Level")

plt.ylabel("State Value")

for i,v in enumerate(V):
    plt.text(i,v+1,round(v,2),ha='center')

plt.show()

# GRAPH 2
# Reward Comparison
eco_reward=[15,12,9,6,3]
normal_reward=[10,8,5,2,-2]
sport_reward=[5,2,-2,-5,-10]

x=np.arange(len(states))
w=0.25

plt.figure(figsize=(9,5))

plt.bar(x-w,eco_reward,width=w,color='green',label='Eco')

plt.bar(x,normal_reward,width=w,color='blue',label='Normal')

plt.bar(x+w,sport_reward,width=w,color='red',label='Sport')

plt.xticks(x,states)

plt.xlabel("Battery Level")

plt.ylabel("Reward")

plt.title("Reward Comparison")

plt.legend()

plt.show()

# GRAPH 3
# Battery Level vs State Value (Line Graph)

plt.figure(figsize=(8,5))

plt.plot(states,V,
         marker='o',
         linewidth=3,
         color='purple',
         markersize=10)

plt.title("Battery Level vs State Value")

plt.xlabel("Battery Level")

plt.ylabel("State Value")

plt.grid(True)

for i,v in enumerate(V):
    plt.text(i,v+1,round(v,2),ha='center')

plt.show()

# GRAPH 4
# Policy Distribution

labels=["Eco","Normal","Sport"]

counts=[eco,normal,sport]

colors=["green","blue","red"]

plt.figure(figsize=(6,5))

plt.bar(labels,counts,color=colors)

plt.title("Optimal Policy Distribution")

plt.ylabel("Frequency")

for i,v in enumerate(counts):
    plt.text(i,v+0.05,str(v),ha='center')

plt.show()
# FINAL RESULT

print("\n")
print("="*60)
print("FINAL RESULT")
print("="*60)

print("• The Bellman-based Optimal Policy Learning algorithm")
print("  successfully learned the best battery management strategy.")

print("\n• Eco Mode produced the highest long-term reward")
print("  across all battery levels.")

print("\n• As the battery level decreases,")
print("  the state value also decreases.")

print("\n• This policy minimizes battery energy consumption")
print("  and improves electric vehicle driving range.")
