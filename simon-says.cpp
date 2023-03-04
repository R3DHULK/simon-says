#include <iostream>
#include <cstdlib>
#include <ctime>
#include <vector>
#include <algorithm>
#include <string>
#include <chrono>
#include <thread>

using namespace std;

// Number of possible colors and length of pattern
const int NUM_COLORS = 4;
const int PATTERN_LENGTH = 10;

// Possible colors
enum Color
{
    RED,
    GREEN,
    BLUE,
    YELLOW
};

// Convert Color enum to string
string colorToString(Color c)
{
    switch (c)
    {
    case RED:
        return "Red";
    case GREEN:
        return "Green";
    case BLUE:
        return "Blue";
    case YELLOW:
        return "Yellow";
    default:
        return "Unknown color";
    }
}

// Generate random pattern
vector<Color> generatePattern()
{
    vector<Color> pattern;
    for (int i = 0; i < PATTERN_LENGTH; i++)
    {
        pattern.push_back(static_cast<Color>(rand() % NUM_COLORS));
    }
    return pattern;
}

// Play back pattern
void playPattern(vector<Color> &pattern)
{
    for (const auto &c : pattern)
    {
        // Print color
        cout << colorToString(c) << endl;
        // Wait for a short time before printing next color
        this_thread::sleep_for(chrono::milliseconds(500));
        // Clear screen
        system("clear");
    }
}

// Get player's input
vector<Color> getPlayerInput()
{
    vector<Color> input;
    for (int i = 0; i < PATTERN_LENGTH; i++)
    {
        string color;
        cout << "Enter color #" << i + 1 << ": ";
        cin >> color;
        transform(color.begin(), color.end(), color.begin(), ::tolower);
        if (color == "red")
        {
            input.push_back(RED);
        }
        else if (color == "green")
        {
            input.push_back(GREEN);
        }
        else if (color == "blue")
        {
            input.push_back(BLUE);
        }
        else if (color == "yellow")
        {
            input.push_back(YELLOW);
        }
        else
        {
            cout << "Invalid color. Please enter red, green, blue, or yellow." << endl;
            i--;
        }
    }
    return input;
}

// Compare player's input to pattern
bool compareInput(vector<Color> &pattern, vector<Color> &input)
{
    for (int i = 0; i < PATTERN_LENGTH; i++)
    {
        if (pattern[i] != input[i])
        {
            return false;
        }
    }
    return true;
}

int main()
{
    // Initialize random seed
    srand(static_cast<unsigned int>(time(nullptr)));

    // Game loop
    while (true)
    {
        // Generate and play back pattern
        vector<Color> pattern = generatePattern();
        playPattern(pattern);

        // Get player's input
        vector<Color> input = getPlayerInput();

        // Compare input to pattern
        if (compareInput(pattern, input))
        {
            cout << "Correct!" << endl;
        }
        else
        {
            cout << "Wrong! The pattern was:" << endl;
            playPattern(pattern);
        }

        // Ask player if they want to play again
        cout << "Play again? (y/n): ";
        string choice;
        cin >> choice;
        transform(choice.begin(), choice.end(), choice.begin(), ::tolower);
        if (choice != "y")
        {
            break;
        }
    }
    return 0;
}
