# Define a sequence of colors for Simon to say
simon_says <- sample(c("red", "blue", "green", "yellow"), 10, replace=TRUE)

# Print instructions
cat("Simon says: ", paste(simon_says, collapse=", "), "\n\n")

# Ask the player to repeat the sequence
cat("Repeat the sequence, separating each color with a comma: ")
player_input <- readline()

# Check if the player's input matches the sequence
if (player_input == paste(simon_says, collapse=",")) {
  cat("\nWell done! You repeated the sequence correctly.\n")
} else {
  cat("\nSorry, that's incorrect. The correct sequence was: ", paste(simon_says, collapse=", "), "\n")
}
