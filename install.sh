echo "Creating symbolic link for .zshrc file...🚀"

[[ -s "$HOME/.zshrc" ]] && rm ~/.zshrc

ln -s ~/arch-dotfiles/.zshrc ~/.zshrc

echo "✨ Done! ✨"