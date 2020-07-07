package main

import (
	"log"
	"os"
	"path/filepath"
)

func main() {
	home := os.Getenv("HOME")
	vimrcPath := filepath.Join(home, ".vimrc")
	wd, _ := os.Getwd()
	repoVimrc := filepath.Join(wd, "vimrc.vim")
	if hasFile(vimrcPath) {
		if err := os.Remove(vimrcPath); err != nil {
			log.Fatalln("vimconfig: error while installing vimrcPath to path")
		}
		if err := os.Symlink(repoVimrc, vimrcPath); err != nil {
			log.Fatalf("vimconfig: error while creating symbolic link for vimrc: %s", err)
		}
		os.Exit(0)
	}
	log.Fatalln("vimconfig: unable to find a vimrc on your home folder")
}

func hasFile(filepath string) bool {
	info, err := os.Stat(filepath)
	if os.IsNotExist(err) {
		return false
	}
	return !info.IsDir()
}
