pragma(lib, "bcrypt"); // this is a Windows-only library, change if you're on Linux or MacOS

import std.stdio;
import std.random;
import std.string;

string[] diceFaces = [
    // index 0 unused to match dice number with array index
    "",
    // 1
    q{
    +-------+
    |       |
    |   o   |
    |       |
    +-------+
    },

    // 2
    q{
    +-------+
    | o     |
    |       |
    |     o |
    +-------+
    },

    // 3
    q{
    +-------+
    | o     |
    |   o   |
    |     o |
    +-------+
    },

    // 4
    q{
    +-------+
    | o   o |
    |       |
    | o   o |
    +-------+
    },

    // 5
    q{
    +-------+
    | o   o |
    |   o   |
    | o   o |
    +-------+
    },

    // 6
    q{
    +-------+
    | o   o |
    | o   o |
    | o   o |
    +-------+
    }
];

string[] openingLines = [
    "",
    "The dice are loaded... or are they?",
    "Everything comes down to this roll.",
    "No one knows what's about to happen, not even the computer itself.",
    "Hope you brought your lucky socks buddy.",
    "Randomness activated. Brace yourself.",
    "This is why we don't trust fate, but we roll anyway.",
    "This could go incredibly well... or hilariously wrong.",
    "Fortune favors the brave... or at least the lucky.",
    "Chance is the only rule that matters now."
];


int declareIndex(string[] arr)
{
    return cast(int) uniform(1, arr.length);
}

int main(string[] args)
{
    int openingLinesIndex = declareIndex(openingLines);
    writeln(openingLines[openingLinesIndex]);

    string die = "
    +-------+
    |       |
    | READY |
    |       |
    +-------+
    ";

    writeln(die);

    while (true)
    {
        writeln("Enter \"1\" if you want to roll the dice or enter \"0\" if you'd like to exit.");
        write("> ");

        string input = strip(readln());

        if (input == "0")
            break;

        if (input == "1")
        {
            int diceFacesIndex = declareIndex(diceFaces);
            die = diceFaces[diceFacesIndex];

            writeln(die);
        }
    }

    return 0;
}
