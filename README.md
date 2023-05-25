# What this is
This is a template designed to ease the workflow when writing documents for the Hochschule Hannover. It is intended to be used in all sophisticated
works, from lab-reports to master’s thesis's.  
The project provides custom document-classes caring the `HsH-` prefix as well as support files. These classes extend the well known KOMA-Script
classes and customize them with specific configurations, presets and provide commonly needed features.

[![Version](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/badges/release.svg)](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/releases)  

**Provided classes are:**

- `HsH-article`
- `HsH-report`
- `HsH-book` (planed)
- `HsH-standalone`



# Quick start guide


## Recommended software

As a Tex-Distribution, [MiKTeX is recommended](https://miktex.org/), TexLive should also work, but I don't use it much.  
To edit the `.tex` files, you could use any text editor, but I personally like [Visual Studio Code](https://code.visualstudio.com/) the most, which
can also be used for pretty much all other programming languages. Use the [Latex Workshop extension](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop),
and you can steal my config file from [here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets/111).  
If you prefer a Tex-only editor, I used [Texmaker](https://www.xm1math.net/texmaker/) in the past, and it's also very good.

If you want to use citations in your work, you should get familiar with the `biblatex` package and include it in your project. The classes set it up
to use `biber` as the backend, which is more modern and has more features than the usual `bibtex`, but you will need to set you editor up to also use
this.


## I have now Idea how to start, show me!

To get you started, there is a working example Project on the example branch that has loads of tips. Check it out
[Online](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/tree/example) or locally using `git checkout example`


## Quick and dirty

To get started, create a new folder for your project somewhere on your PC and create your `.tex` file. Copy the class file (`.cls`) you want to use
and the `HsH-logo.pdf` from the src folder to your project folder. You can optionally copy the `config.tex`, but you can also configure everything in
your preamble.


## Using a proper subfolder structure

The projects also provides a recommendation for a subfolder structure, to keep things organized. You can
[download the .zip-Archive](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/archive/master/latex-template-hsh-master.zip)
and unpack it or clone the repository via `git clone https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh.git`.
This has the downside of storing class files and other needed files in the _./src_ folder, which means it needs to be added to the path searched when
running your latex command ([see below](#adding-src-to-path)).  
The provided Makefile demonstrates how to run a successful build, you might want to check it out.



# Documentation


## The different classes

This project provides a set of additional classes designed for use in the Hochschule Hannover, Germany. They extend the well-known [KOMA-Script
classes](https://ctan.org/pkg/koma-script) by adding styling and providing some additional commands. The provided classes are:

### `HsH-article`

Based on the `scrartcl` this class is designed for quick and compact documents. It does not have chapters and therefore never breaks to a new page on
its own. This class is useful for writing lab-protocols and alike.

### `HsH-report`
This is probably the most useful class. It is based on the `scrreprt` and can be used for a wide variety of documents, beginning with lab-reports and
ending at complete thesis. The line between article and report is somewhat blurry, so use as you see fit.

### `HsH-book`
// To-do

### `HsH-standalone`
A helper class based on the normal standalone class. It is designed only for creating images as separate documents to keep things organized and
compiler times low. It is useful for creating graphs, circuit diagrams or other kind of complex sub documents.


## Document Options

The classes accept a number of new options, which are passed to the class via `\documentclass[options]{class}`. All unknown options are passed to the
underlying subclass and processed there. So you can use everything from the corresponding documentations.

### Default Options
If you don't define something different, the classes set your project up to use the following options:
- `fontsize=11pt` the font size
- `a4paper` the paper size
- `ngerman` the document language
- `sans` the font type (Sans Serif)
- `margin=0.25cm` ONLY for `hsh-standalone`, adds an empty margin around all pages

### List of all options
- `german`, `ngerman` These two options are aliases. They switch the document language to German, which affects autogenerated naming as well as the
  formatting of numbers. This is implemented by using an internal if switch, called `\@german`, which is set to true.
- `english` This option is the opposite of the previous ones. It sets the document language to English by setting `\@german` to false.
- `f1` - `f5` To use the correct logo of a certain faculty, you can define your faculty with these options. If none of these are present, a generic
  grey logo is chosen.  
  The different logos correspond to different pages of the `HsH-Logo.pdf`, so you could change this file and therefore the used logo as long as you
  keep the page numbering consistent with the original.
- `sans` This option sets the font family to Sans Serif.
- `roman` The opposite of `sans`, sets a roman/serif font.

All remaining options are passed along to the respective subclasses and processed there. This means, that you can use all the options described in
their respec­tive documentations.


## Packages

### Provided packages
These Packages are automatically included by the class file. These are either important for provided functions or so generally useful that they are
used in pretty much every project anyway.

- `inputenc` for input encoding, all input files (.tex files, etc.) are expected to be UTF8 encoded
- `fontenc` for output encoding, set to T1, if you use non-Latin characters (like Cyrillic, etc.) you need to add that
- `lmodern` is a font
- `babel` for German typesetting
- `geometry` for margins and stuff, (will probably be removed at some point)
- `scrlayer-scrpage` KOMA package for headers and footers
- `scrhack` KOMA package for compatibility with listings
- `pgffor` allows for the use of for-loops (internal)
- `graphicx` for importing images
- `hyperref` for references and links
- `caption` to customize captions and make references point to the beginning of the floats
- `bookmark` for bookmarking
- `amsmath` for a lot of general purpose maths features
- `csquotes` makes quotations easier
- `ziffer` is only included when the German document option is provided, sets comma as decimal

### Recommended packages
These packages are recommended, but not included automatically to save compile time when they are not needed. If you want to use one of them, include
it in your preamble.

- `bibtex` a package for citation and source management. Keep in mind, that there are multiple backends and `biber` is configured, if you want to
  continue using the old backend, type `\usepackage[backend=bibtex]{biblatex}` in your preamble.
- `subfigure` one of multiple packages, that allows you to put multiple images into a figure
- `siunitx` is an amazing tool for Units
- `csvsimple` allows you to import CSV files, which is handy if you want to display measurements
- `listings` allows you to include format code snippets
- `pgfplots` is a great maths engine, which can create amazing plots
- `tikz` is already included with pgfplots, but is also a nice standalone package
- `circuitikz` expands the previous packages with macros for circuit creation
- `standalone` is a package, that allows you to create simple images from sub-texfiles. This can save a lot of compile time, especially with tikz and
  alike.

There's more...


## Commands

The classes provide a few commands of their own. Here are some explanations:

### `\maketitle[align]`
This command is not new, but changed. It creates a title-page fitting for most use cases. You can change its alignment via the optional parameter by
using on of the three options `r`, `c` or `l` for right aligned, centred or left aligned.  
You can use the following macros to define the different information presented on the title-page:

- `\author` as usual, this is where you put your name. But you can also input a comma-seperated list, if more than one person has written in this file.
- `\matrikelnr` a new macro for your matriculation number. This is optional, but will be put next to your name if present. You can input again a
  comma-seperated list, if more than one author is present.
- `\titlehead` is for a small line left of the logo. This is usually the department or division. May be empty
- `\subject` is for a broad description of what your file is. "Laborbericht" for example. Can be empty.
- `\title` is quite obvious. The only one that must be present. I additionally accept an optional parameter which will be treated as a short form of
  the title and used in the header (this makes sense if your title is very long and fills your header too much)
- `\subtitle` is a smaller second line under the title. Can be empty
- `\date` is the date of your project. You can use a custom one, but if you don't set it, the current date at compile time will be used.
- `\professor` a new macro do define your professors name, if needed.
- `\keywords` will not be printed on the title-page, but rather on the end of the abstract, if you define some. They will also be but into the PDFs
  metadata.

### `\declarationAuthorship`
This macro will typeset a declaration of authorship, which is needed for most academic works. It will be produced at the bottom of the current page,
separated by a horizontal line.  
The macro is defined in German and English and will automatically match your document language.

### `\abs`
A helpful macro for absolute values. It can be used in maths mode and will put vertical lines around its content, that match the height of the
content.  
This macro is only provided, meaning if another package defines it, its definition will be used.

### HsH-Logo macros
These are more of a by-product, but they are defined, so you could use them:
- `\HsHlogoPath` the path to an image, that is used as the logo. Given a default value by the class.
- `\HsHlogoPage` the page of the previous file, which is used. This is changed with the `f1`-`f5` options.
- `\includeHsHlogohere[width]` this macro produces the logo using the previous macros. The width can optionally be provided.



# Common additions and expansions (Snippets)

Sadly most Profs have widely different expectations when it comes to styling of written works. So you might find yourself having to change some
settings. For some cases this has already been done and, to help others, uploaded in
[the snippets section](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets) of the project. Most of them are only visible when you
are logged in!!  
Also, if you create your own set of additions that are useful for other, feel free to contact me and I will give you access right, so you can upload
it there.



# Frequently Asked Questions


## What is the `config.tex`?

These file is an easy way to configure your project in a single central location, so it can be used over multiple documents in the same project as
well as allowing easy reuse of configs for other projects.

The provided classes automatically check for this file and use it, if it is present. But they are completely optional, so you can just ditch them if
you want to. Keep in mind that the `config.tex` will be included right before the `\begin{document}`, so it overrides all settings you may have put
in your preamble.

The `config.tex` is intended for configurations. For example new- or redefinitions of commands should be put here. Also, packages-specific configs are
loaded here. The `\@ifpackageloaded{pakagename}{true}{false}` macro allows to check for the existence of a package, so that you can reuse config files,
even if you don't use all the same packages.


## Adding _./src_ to path

You need to do this if you get errors like this:

> ! LaTeX Error: File `HsH-report.cls' not found.

This means LaTeX can't find the additional files provided by this project, and you need to tell it that they are inside the _./src_ directory.  
Here is how to do that:

### Using MiKTeX
MiKTeX makes this very easy by adding an option for that. Just add `-include-directory=./src` to your call to `pdflatex`.  
For building from sub folders, just add a second `-include-directory=../src` to your call.


### Using Texmaker and MiKTeX
As stated above, you just need to extend your Latex-call with the needed include path.  
To do this, go to _Options → config Texmaker → Commands_  
change the pdflatex command to:

```bash
pdflatex -synctex=1 -interaction=nonstopmode -include-directory=./src -include-directory=../src %.tex
```

### Using VS Code with LaTeX Workshop
In VS Code you can configure your launch to set environment variables. Just edit your `settings.json`, so that your pdflatex tool contains a `env:`
(add it, if it isn't there yet). If you use the template below, you will also get some additional nice configurations. See also
[here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets/111) for some additional configs.

```json
"latex-workshop.latex.tools": [
    {
        "name": "pdflatex",
        "command": "pdflatex",
        "args": [
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "-aux-directory=%OUTDIR%/.aux",
            "-output-directory=%OUTDIR%",
            "%DOC%"
        ],
        "env": {
            "TEXINPUTS": "%DIR%/src/;%DIR%/../src/"
        }
    }
]
```

### On Overleaf
The easiest way would be to just move the class file you need and the `HsH-logo.pdf` and `config.tex` to the project root (next to your
`project.tex`).  
Alternatively, overleaf uses `latexmk` in the background, so you can change its configuration. As explained
[here](https://www.overleaf.com/learn/latex/Questions/I_have_a_lot_of_.cls%2C_.sty%2C_.bst_files%2C_and_I_want_to_put_them_in_a_folder_to_keep_my_project_uncluttered._But_my_project_is_not_finding_them_to_compile_correctly),
add the `latexmkrc` file and put this line into it:

```bash
$ENV{'TEXINPUTS'}='./src/:';
```

Now your project should compile just fine.


## Using an _.aux_ directory

It is very useful to define subdirectory for all the files produced during a latex run. Here is how you can keep your directory cleaner.

### MiKTeX
MiKTeX allows you to define a directory to put all the temporary files in via the option `-aux-directory`. So you can modify your pdflatex call like
this:

```bash
pdflatex -aux-directory=.aux project.tex
```

This is different from where the produced PDF is placed. This can be modified using the `-output-directory` option. So calling latex like the
following, will produce a `pdf` next to the `tex` file and all temporary files in the subdirectory `.aux`

```bash
pdflatex -output-directory=. -aux-directory=.aux project.tex
```

### TexLive
TexLive does not have this functionality built-in.


## LaTeX errors

> You have requested document class \`src/HsH-report', but the document class provides \`HsH-report'.

This happens when you tried to use something like `\documentclass{src/HsH-report}`, which was a good idea, but doesn't quite work. You need to properly
add the `src` directory to the path searched by LaTeX (as explained [here](#adding-src-to-path)). You can than simply use `\documentclass{HsH-report}`.

## BibTeX errors

> Sorry, but BibTeX did not succeed

You are probably using `bibtex` as your backend, but `biber` the standard configuration. You can change it, see
[here for most editors](https://texwelt.de/fragen/1909/wie-verwende-ich-biber-in-meinem-editor) and [here for VS Code](https://tex.stackexchange.com/questions/459640/implementing-biber-for-biblatex-in-microsoft-visual-studio-code/459933#459933)
or use `\usepackage[backend=bibtex]{biblatex}` in your preamble to keep using BibTeX.


## Italic vs. upright Index? (changing subscript)

The classes by default set all sub scripts upright ("steil" in German), because this is required in Germany in most cases.  
You can deactivate this permanently with `\normalsubscripts` and reactivate it with `\upsubscripts`.  
If you want to change it for a single use, you can use the original Tex Macro `\sb{}` instead of the `_` to get the original behaviour.  
DO NOT use `_\math..{}`! This would be a nested font change and lead to unexpected results. `\sb{\math..{}}` is possible.
