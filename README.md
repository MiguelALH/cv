# CV

Miguel Angel Lopez Hernandez - Curriculum Vitae

[![Preview](https://github.com/MiguelALH/cv/blob/master/preview.png)](https://github.com/MiguelALH/cv/blob/master/MiguelALH-cv-en.pdf)

## PDF

You can get the latest version in PDF [here](https://github.com/MiguelALH/cv/blob/master/MiguelALH-cv-en.pdf)

## Acknowledgments

Based on [Friggeri Résumé/CV](http://www.latextemplates.com/template/friggeri-resume-cv)

## Requirements

- `texlive-xetex`

### Ubuntu/Debian

```shell
sudo apt install texlive-latex-extra
sudo apt install texlive-fonts-extra
```

### Fedora
```shell
sudo dnf install texlive-scheme-medium
sudo dnf install texlive-roboto
sudo dnf install telive-textpos
sudo dnf install telive-fontawesome

sudo dnf install google-roboto-fonts
sudo dnf install google-roboto-condensed-fonts
```

- Fonts: Font Awesome, Hack Nerd Font

## Preview

```shell
convert cv.pdf -background white -alpha remove preview.png
```

## Build

`xelatex file-cv.tex`

Run the command multiple times on the first build.
