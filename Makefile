all:
	cd stow && stow --verbose --target=$$HOME --restow * && cd ..

delete:
	cd stow && stow --verbose --target=$$HOME --delete * && cd ..
