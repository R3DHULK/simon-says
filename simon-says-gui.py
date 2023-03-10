import tkinter as tk
import random

# Define colors
COLORS = {"red": "#ff0000", "blue": "#0000ff",
          "green": "#00ff00", "yellow": "#ffff00"}


class SimonSaysGame:
    def __init__(self, master):
        self.master = master
        self.master.title("Simon Says")

        # Initialize variables
        self.sequence = []
        self.sequence_index = 0
        self.player_sequence = []
        self.player_sequence_index = 0
        self.score = 0

        # Create GUI elements
        self.score_label = tk.Label(
            self.master, text="Score: 0", font=("Arial", 20))
        self.score_label.pack(pady=10)

        self.color_buttons = []
        for color in COLORS:
            button = tk.Button(self.master, bg=color, width=10, height=5,
                               command=lambda color=color: self.color_button_clicked(color))
            button.pack(side=tk.LEFT, padx=10, pady=10)
            self.color_buttons.append(button)

        self.start_button = tk.Button(self.master, text="Start", font=(
            "Arial", 16), command=self.start_game)
        self.start_button.pack(pady=20)

    def start_game(self):
        self.score = 0
        self.score_label.config(text=f"Score: {self.score}")
        self.sequence = [random.choice(list(COLORS.keys())) for _ in range(5)]
        self.sequence_index = 0
        self.player_sequence = []
        self.player_sequence_index = 0
        self.start_next_sequence()

    def start_next_sequence(self):
        self.master.after(1000, self.highlight_next_color)

    def highlight_next_color(self):
        if self.sequence_index >= len(self.sequence):
            self.master.after(1000, self.end_game)
            return

        color = self.sequence[self.sequence_index]
        self.color_buttons[list(COLORS.keys()).index(
            color)].config(relief=tk.SUNKEN)
        self.master.after(500, lambda: self.color_buttons[list(
            COLORS.keys()).index(color)].config(relief=tk.RAISED))
        self.sequence_index += 1
        self.master.after(1000, self.highlight_next_color)

    def color_button_clicked(self, color):
        if self.sequence_index <= len(self.sequence) and color == self.sequence[self.player_sequence_index]:
            self.player_sequence.append(color)
            self.player_sequence_index += 1

            if self.player_sequence_index == len(self.sequence):
                self.score += 1
                self.score_label.config(text=f"Score: {self.score}")
                self.start_next_sequence()
                self.player_sequence = []
                self.player_sequence_index = 0
        else:
            self.end_game()

    def end_game(self):
        tk.messagebox.showinfo("Game Over", f"Your score is {self.score}")
        self.start_button.config(state=tk.NORMAL)


if __name__ == "__main__":
    root = tk.Tk()
    game = SimonSaysGame(root)
    root.mainloop()
