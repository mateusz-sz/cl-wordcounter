import random
import string
import sys

# Function to generate a random word of a random length
def generate_random_word():
    word_length = random.randint(3, 10)  # Random length between 3 and 10 characters
    return ''.join(random.choices(string.ascii_letters, k=word_length))

# Function to generate a specified number of random words
def generate_random_words(num_words):
    return ' '.join(generate_random_word() for _ in range(num_words))

def main():
    # Get the number of words from command line argument
    if len(sys.argv) != 2:
        print("Usage: python generate_words.py <number_of_words>")
        sys.exit(1)
    
    try:
        num_words = int(sys.argv[1])
        if num_words <= 0:
            raise ValueError
    except ValueError:
        print("Please provide a valid positive integer for the number of words.")
        sys.exit(1)
    
    # Generate random words and write them to a file
    random_words = generate_random_words(num_words)
    with open("random_words.txt", "w") as f:
        f.write(random_words)
    
    print("Generated random words in 'random_words.txt'")

if __name__ == "__main__":
    main()

