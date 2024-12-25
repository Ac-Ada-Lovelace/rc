

# Clean the build
make clean

# Build the project
make build

# Remove a.asm if it exists
rm -f a.asm

# Run the tcc compiler on a.c and output to a.asm
./tcc < a.c > a.asm