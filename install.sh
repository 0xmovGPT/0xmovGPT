# Exit immediately if a command exits with a non-zero status.
set -e

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
# Source the cargo environment to make rustc, cargo, etc. available in the current shell
source "$HOME/.cargo/env"

# Install Foundry
echo "Installing Foundry..."
curl -L https://foundry.paradigm.xyz | bash
# foundryup is installed to ~/.foundry/bin, so we'll add that to the path for the current session
export PATH="$HOME/.foundry/bin:$PATH"
foundryup

# Install nvm, Node.js, and npm
echo "Installing Node.js and npm via nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install --lts

# Install Gemini CLI
echo "Installing Gemini CLI..."
npm install -g @google/gemini-cli

echo "Installation complete!"
echo "Please restart your terminal or run 'source ~/.bashrc' (or your shell's equivalent) to apply all changes."
