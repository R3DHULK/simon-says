#!/usr/bin/perl

use strict;
use warnings;

# Define the colors
my @colors = ("red", "green", "blue", "yellow");

# Define the game variables
my @sequence;
my $round = 1;
my $score = 0;

# Print the welcome message
print "Welcome to Simon Says!\n\n";

# Main game loop
while (1) {
    # Generate a new sequence for this round
    print "Round $round - Simon says...\n";
    push @sequence, $colors[int(rand(@colors))];
    print join(", ", @sequence) . "\n";

    # Get the user's input
    print "Repeat the sequence: ";
    chomp(my $input = <STDIN>);
    my @input_sequence = split(/,\s*/, $input);

    # Check the user's input
    my $correct = 1;
    for (my $i = 0; $i < @sequence; $i++) {
        if ($sequence[$i] ne $input_sequence[$i]) {
            $correct = 0;
            last;
        }
    }

    # Display the result
    if ($correct) {
        $score++;
        print "Correct! Your score is now $score.\n";
    } else {
        print "Incorrect! Game over. Your final score is $score.\n";
        last;
    }

    # Increase the round counter
    $round++;
}
