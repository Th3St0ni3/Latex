%%
%% This is file `HsH-standalone.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% HsH-classes.dtx  (with options: `standalone')
%%
%% This is a generated file.
%%
%% Copyright (C) 2021 by Jan Wille <mail@janwille.de>
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2021/01/01 or later.
%%
\typeout{Adapted from KOMA script for use in Hochschule Hannover <2022-03-28> Jan Wille}
\NeedsTeXFormat{LaTeX2e}
\newcommand{\myClassName}{HsH-standalone}
\ProvidesClass{\myClassName}[2022/03/28 v1.4 HsH-Class based on KOMA]

%% commands for HsH-logo
\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{1}
\newcommand{\includeHsHlogohere}[1][5cm]{\includegraphics[width=#1,page=\HsHlogoPage]{\HsHlogoPath}}
\newif\if@german%

%% document options -------------------------------------------------------------------------------
\DeclareOption{german}{
  \@germantrue
}
\DeclareOption{ngerman}{
  \@germantrue
}
\DeclareOption{english}{
  \@germanfalse
}
\DeclareOption{f1}{
  \renewcommand{\HsHlogoPage}{2}
}
\DeclareOption{f2}{
  \renewcommand{\HsHlogoPage}{3}
}
\DeclareOption{f3}{
  \renewcommand{\HsHlogoPage}{4}
}
\DeclareOption{f4}{
  \renewcommand{\HsHlogoPage}{5}
}
\DeclareOption{f5}{
  \renewcommand{\HsHlogoPage}{6}
}
\DeclareOption{sans}{
  \renewcommand{\familydefault}{\sfdefault}
}
\DeclareOption{roman}{
  \renewcommand{\familydefault}{\rmdefault}
}
\DeclareOption*{\expandafter\PassOptionsToClass\expandafter{\CurrentOption}{standalone}}
\ExecuteOptions{margin=0.25cm,fontsize=11pt,a4paper,ngerman,sans} % default options
\ProcessOptions\relax
%% Load KOMA class
\LoadClass[multi=tikzpicture,multi=circuitikz]{standalone}

%% package loading and config ---------------------------------------------------------------------
\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\if@german\RequirePackage{ziffer}\fi
%% options for not loaded packages ----------------------------------------------------------------
\PassOptionsToPackage{free-standing-units}{siunitx}
\PassOptionsToPackage{european,EFvoltages,straightvoltages,betterproportions}{circuitikz}

%% typesetting indexes upright or standart
\def\subinrm#1{\sb{\mathrm{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\mathcode`_="8000
\newcommand\upsubscripts{\catcode`\_=12 }
\newcommand\normalsubscripts{\catcode`\_=8 }
\upsubscripts

%% load config at beginning of document
\AtBeginDocument{
  \makeatletter
  \@ifpackageloaded{biblatex}{
    \renewcommand*{\mkbibacro}[1]{\MakeUppercase{#1}}
  }{}
  \@ifpackageloaded{subfigure}{
    \newcommand{\subfigureautorefname}{\figureautorefname}
  }{}
  \InputIfFileExists{config.tex}{
    \ClassInfo{\myClassName}{config.tex was found. Using it...}
  }{
    \ClassInfo{\myClassName}{no config.tex!! I hope you configered it yourself.}
  }
  %% provide some usefull commands:
  \providecommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}}
  \makeatother
}
\endinput
%%
%% End of file `HsH-standalone.cls'.
