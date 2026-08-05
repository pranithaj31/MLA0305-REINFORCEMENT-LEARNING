#==========================================================
# MARKOV DECISION PROCESS (MDP)
# States, Actions, Transition Probabilities and Rewards
#==========================================================

#-----------------------------
# Define States
#-----------------------------
states <- c("S1", "S2", "S3")

#-----------------------------
# Define Actions
#-----------------------------
actions <- c("A1", "A2")

#-----------------------------
# Display States and Actions
#-----------------------------
cat("=====================================================\n")
cat("       MARKOV DECISION PROCESS (MDP)\n")
cat("=====================================================\n\n")

cat("States:\n")
print(states)

cat("\nNumber of States :", length(states), "\n\n")

cat("Actions:\n")
print(actions)

cat("\nNumber of Actions :", length(actions), "\n\n")

#==========================================================
# Transition Probability Table
#==========================================================

transition <- data.frame(
  From_State = c(
    "S1","S1","S1","S1",
    "S2","S2","S2","S2",
    "S3","S3","S3","S3"
  ),
  
  Action = c(
    "A1","A2","A1","A2",
    "A1","A2","A1","A2",
    "A1","A2","A1","A2"
  ),
  
  To_State = c(
    "S2","S2","S3","S3",
    "S1","S1","S3","S3",
    "S1","S1","S2","S2"
  ),
  
  Probability = c(
    0.6,0.4,
    0.2,0.8,
    0.7,0.3,
    0.5,0.5,
    0.9,0.1,
    0.4,0.6
  ),
  
  stringsAsFactors = FALSE
)

cat("=====================================================\n")
cat("Transition Probabilities\n")
cat("=====================================================\n")

print(transition)

cat("\nTotal Transition Entries :", nrow(transition), "\n\n")

#==========================================================
# Reward Table
#==========================================================

rewards <- data.frame(
  From_State = c(
    "S1","S1","S1","S1",
    "S2","S2","S2","S2",
    "S3","S3","S3","S3"
  ),
  
  Action = c(
    "A1","A2","A1","A2",
    "A1","A2","A1","A2",
    "A1","A2","A1","A2"
  ),
  
  To_State = c(
    "S2","S2","S3","S3",
    "S1","S1","S3","S3",
    "S1","S1","S2","S2"
  ),
  
  Reward = c(
    5,10,
    -1,-5,
    3,7,
    2,1,
    4,6,
    0,-2
  ),
  
  stringsAsFactors = FALSE
)

cat("=====================================================\n")
cat("Rewards Associated with Each Transition\n")
cat("=====================================================\n")

print(rewards)

cat("\nTotal Reward Entries :", nrow(rewards), "\n\n")

#==========================================================
# Display Each Transition with Reward
#==========================================================

cat("=====================================================\n")
cat("Transition and Reward Details\n")
cat("=====================================================\n")

mdp <- merge(
  transition,
  rewards,
  by = c("From_State", "Action", "To_State")
)

print(mdp)

#==========================================================
# Summary
#==========================================================

cat("\n=====================================================\n")
cat("MDP SUMMARY\n")
cat("=====================================================\n")

cat("Number of States            :", length(states), "\n")
cat("Number of Actions           :", length(actions), "\n")
cat("Transition Probability Rows :", nrow(transition), "\n")
cat("Reward Entries              :", nrow(rewards), "\n")

cat("\nState Space : ")
cat(states, sep = "  ")

cat("\n\nAction Space : ")
cat(actions, sep = "  ")

cat("\n\nProgram Executed Successfully.\n")
cat("=====================================================\n")




#==========================================
# Transition Probability Matrices
#==========================================

states <- c("S1", "S2", "S3")

#------------------------------------------
# Transition Matrix for Action A1
#------------------------------------------

P_A1 <- matrix(c(
  0.0, 0.6, 0.2,   # From S1 -> S1,S2,S3
  0.7, 0.0, 0.5,   # From S2 -> S1,S2,S3
  0.9, 0.4, 0.0    # From S3 -> S1,S2,S3
), nrow = 3, byrow = TRUE)

rownames(P_A1) <- states
colnames(P_A1) <- states

cat("=========================================\n")
cat("Transition Probability Matrix for Action A1\n")
cat("=========================================\n")
print(P_A1)

#------------------------------------------
# Transition Matrix for Action A2
#------------------------------------------

P_A2 <- matrix(c(
  0.0, 0.4, 0.8,   # From S1 -> S1,S2,S3
  0.3, 0.0, 0.5,   # From S2 -> S1,S2,S3
  0.1, 0.6, 0.0    # From S3 -> S1,S2,S3
), nrow = 3, byrow = TRUE)

rownames(P_A2) <- states
colnames(P_A2) <- states

cat("\n=========================================\n")
cat("Transition Probability Matrix for Action A2\n")
cat("=========================================\n")
print(P_A2)


#==========================================
# Reward Matrix
#==========================================

reward_matrix <- data.frame(
  
  Current_State = c(
    "S1","S1","S1","S1",
    "S2","S2","S2","S2",
    "S3","S3","S3","S3"
  ),
  
  Action = c(
    "A1","A2","A1","A2",
    "A1","A2","A1","A2",
    "A1","A2","A1","A2"
  ),
  
  Next_State = c(
    "S2","S2","S3","S3",
    "S1","S1","S3","S3",
    "S1","S1","S2","S2"
  ),
  
  Reward = c(
    5, 10,
    -1, -5,
    3,  7,
    2,  1,
    4,  6,
    0, -2
  ),
  
  stringsAsFactors = FALSE
)

cat("=========================================\n")
cat("Reward Matrix\n")
cat("=========================================\n")

print(reward_matrix, row.names = FALSE)

#=========================================================
# Expected Immediate Reward Calculation
#=========================================================

cat("====================================================\n")
cat("EXPECTED IMMEDIATE REWARD CALCULATION\n")
cat("====================================================\n\n")

#-----------------------------
# S1
#-----------------------------

cat("Current State : S1\n\n")

# Action A1
cat("Action : A1\n")
cat("Calculation:\n")
cat("= (0.6 × 5) + (0.2 × -1)\n")
eir_s1_a1 <- 0.6*5 + 0.2*(-1)
cat("= ",0.6*5," + ",0.2*(-1),"\n")
cat("Expected Immediate Reward =", eir_s1_a1,"\n\n")

# Action A2
cat("Action : A2\n")
cat("Calculation:\n")
cat("= (0.4 × 10) + (0.8 × -5)\n")
eir_s1_a2 <- 0.4*10 + 0.8*(-5)
cat("= ",0.4*10," + ",0.8*(-5),"\n")
cat("Expected Immediate Reward =", eir_s1_a2,"\n\n")

#-----------------------------
# S2
#-----------------------------

cat("----------------------------------------------------\n")
cat("Current State : S2\n\n")

# Action A1
cat("Action : A1\n")
cat("Calculation:\n")
cat("= (0.7 × 3) + (0.5 × 2)\n")
eir_s2_a1 <- 0.7*3 + 0.5*2
cat("= ",0.7*3," + ",0.5*2,"\n")
cat("Expected Immediate Reward =", eir_s2_a1,"\n\n")

# Action A2
cat("Action : A2\n")
cat("Calculation:\n")
cat("= (0.3 × 7) + (0.5 × 1)\n")
eir_s2_a2 <- 0.3*7 + 0.5*1
cat("= ",0.3*7," + ",0.5,"\n")
cat("Expected Immediate Reward =", eir_s2_a2,"\n\n")

#-----------------------------
# S3
#-----------------------------

cat("----------------------------------------------------\n")
cat("Current State : S3\n\n")

# Action A1
cat("Action : A1\n")
cat("Calculation:\n")
cat("= (0.9 × 4) + (0.4 × 0)\n")
eir_s3_a1 <- 0.9*4 + 0.4*0
cat("= ",0.9*4," + ",0,"\n")
cat("Expected Immediate Reward =", eir_s3_a1,"\n\n")

# Action A2
cat("Action : A2\n")
cat("Calculation:\n")
cat("= (0.1 × 6) + (0.6 × -2)\n")
eir_s3_a2 <- 0.1*6 + 0.6*(-2)
cat("= ",0.1*6," + ",0.6*(-2),"\n")
cat("Expected Immediate Reward =", eir_s3_a2,"\n\n")

#=========================================================
# Summary Table
#=========================================================

result <- data.frame(
  State = c("S1","S1","S2","S2","S3","S3"),
  Action = c("A1","A2","A1","A2","A1","A2"),
  Expected_Reward = c(
    eir_s1_a1,
    eir_s1_a2,
    eir_s2_a1,
    eir_s2_a2,
    eir_s3_a1,
    eir_s3_a2
  )
)

cat("====================================================\n")
cat("SUMMARY OF EXPECTED IMMEDIATE REWARDS\n")
cat("====================================================\n")
print(result, row.names = FALSE)

#==========================================================
# Visualization of MDP Summary using Grid
#==========================================================

library(grid)

# Summary data
summary_table <- data.frame(
  State = c("S1","S1","S2","S2","S3","S3"),
  Action = c("A1","A2","A1","A2","A1","A2"),
  Transition = c("S1 → S2","S1 → S3",
                 "S2 → S1","S2 → S3",
                 "S3 → S1","S3 → S2"),
  Expected_Reward = c(2.8,0.0,3.1,2.6,3.6,-0.6),
  stringsAsFactors = FALSE
)

grid.newpage()

# Title
grid.text(
  "MARKOV DECISION PROCESS (MDP)\nExpected Immediate Reward Summary",
  y = 0.95,
  gp = gpar(fontsize = 18, fontface = "bold", col = "navy")
)

# Table position
start_x <- 0.08
start_y <- 0.83

cell_w <- 0.22
cell_h <- 0.09

# Header names
headers <- c("Current State","Action","Transition","Expected Reward")

# Header colors
header_cols <- c("steelblue4","darkgreen","darkorange3","purple4")

# Draw header
for(i in 1:4){
  
  grid.rect(
    x = start_x + (i-1)*cell_w,
    y = start_y,
    width = cell_w,
    height = cell_h,
    just = "left",
    gp = gpar(fill = header_cols[i], col = "white", lwd = 2)
  )
  
  grid.text(
    headers[i],
    x = start_x + (i-1)*cell_w + cell_w/2,
    y = start_y,
    gp = gpar(col = "white", fontsize = 12, fontface = "bold")
  )
}

# Cell colors
state_col <- "lightcyan"
action_col <- "honeydew"
transition_col <- "moccasin"
reward_col <- "lavender"

# Draw rows
for(r in 1:nrow(summary_table)){
  
  yy <- start_y - r*cell_h
  
  # State
  grid.rect(
    x = start_x,
    y = yy,
    width = cell_w,
    height = cell_h,
    just = "left",
    gp = gpar(fill = state_col, col = "black")
  )
  
  grid.text(summary_table$State[r],
            x = start_x + cell_w/2,
            y = yy,
            gp = gpar(fontsize = 12,fontface="bold"))
  
  # Action
  grid.rect(
    x = start_x + cell_w,
    y = yy,
    width = cell_w,
    height = cell_h,
    just = "left",
    gp = gpar(fill = action_col, col = "black")
  )
  
  grid.text(summary_table$Action[r],
            x = start_x + 1.5*cell_w,
            y = yy,
            gp = gpar(fontsize = 12,fontface="bold"))
  
  # Transition
  grid.rect(
    x = start_x + 2*cell_w,
    y = yy,
    width = cell_w,
    height = cell_h,
    just = "left",
    gp = gpar(fill = transition_col, col = "black")
  )
  
  grid.text(summary_table$Transition[r],
            x = start_x + 2.5*cell_w,
            y = yy,
            gp = gpar(fontsize = 12))
  
  # Reward
  grid.rect(
    x = start_x + 3*cell_w,
    y = yy,
    width = cell_w,
    height = cell_h,
    just = "left",
    gp = gpar(fill = reward_col, col = "black")
  )
  
  grid.text(summary_table$Expected_Reward[r],
            x = start_x + 3.5*cell_w,
            y = yy,
            gp = gpar(fontsize = 12,fontface="bold",col="blue"))
}

# Legend
grid.text("Legend",
          x = 0.12,
          y = 0.08,
          gp = gpar(fontsize=14,fontface="bold"))

grid.rect(x=0.28,y=0.08,width=0.03,height=0.03,
          gp=gpar(fill=state_col))
grid.text("State",x=0.34,y=0.08)

grid.rect(x=0.46,y=0.08,width=0.03,height=0.03,
          gp=gpar(fill=action_col))
grid.text("Action",x=0.53,y=0.08)

grid.rect(x=0.66,y=0.08,width=0.03,height=0.03,
          gp=gpar(fill=transition_col))
grid.text("Transition",x=0.76,y=0.08)

grid.rect(x=0.90,y=0.08,width=0.03,height=0.03,
          gp=gpar(fill=reward_col))
grid.text("Reward",x=0.97,y=0.08)

# Install package (only once)
# install.packages("DiagrammeR")

library(DiagrammeR)

grViz("

digraph MDP {

graph [
layout = dot,
rankdir = TB,
splines = ortho,
nodesep = 0.6,
ranksep = 0.8,
bgcolor = white
]

node [
shape = rectangle,
style = 'rounded,filled',
fontname = Helvetica,
fontsize = 16,
color = black,
penwidth = 2
]

#-------------------------------
# Nodes
#-------------------------------

A [label='MARKOV\nDECISION PROCESS\n(MDP)',
   fillcolor='#1F77B4',
   fontcolor='white',
   width=2.5]

B [label='Define\nStates\n(S1, S2, S3)',
   fillcolor='#2ECC71']

C [label='Define\nActions\n(A1, A2)',
   fillcolor='#F4D03F']

D [label='Input\nTransition\nProbabilities',
   fillcolor='#5DADE2']

E [label='Input\nReward\nMatrix',
   fillcolor='#F1948A']

F [label='Expected\nImmediate\nReward',
   fillcolor='#AF7AC5',
   fontcolor='white']

G [label='Compare\nActions',
   fillcolor='#58D68D']

H [label='Select\nOptimal Policy',
   fillcolor='#EB984E']

I [label='Final Output\nPolicy & Results',
   fillcolor='#85C1E9']

#-------------------------------
# Connections
#-------------------------------

A -> B
A -> C

B -> D
C -> D

D -> E
E -> F
F -> G
G -> H
H -> I

#-------------------------------
# Same Rank
#-------------------------------

{rank=same; B C}

}
")