" Macros for typing C code.
" To invoke this file after vi startup read it into a buffer, e.g. x
" then execute it by typing :@x (i.e. an ex command on bottom line).

set nocompatible

" use auto-indenting by 2 spaces. ensure tabs are never inserted and
" tab key indents by 2 spaces. enable mouse.
set autoindent shiftwidth=2 expandtab tabstop=2 textwidth=80 mouse=a
set nu

" GUI COLORSCHEME
" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"set t_Co=256
"set t_Co=88
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme wombat
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme wombat
  endif

" Useful reminder: to fix someone else's crappy indenting go to start of buffer
" and type =G
" This will redo the indentation for the whole buffer according to current
" settings.

" define some useful insert mode shortcuts for C/C++ syntax.
imap  #en  #endif    /*  */<Esc>2hi
imap  #nd  #ifndef <Esc>a
imap  #if  #ifdef <Esc>a
imap  #de  #define<Space>
imap  #ii  #include ""<Esc>i
imap  #ic  #include <><Esc>i
imap  #/   /*<CR> *  <CR>*/<Esc>kA
imap  'wh  while (  )<CR>{<CR>}<Esc>2k0f(la
imap  'un  union <CR>{<CR>};<Esc>2kA
imap  'sw  switch (  )<CR>{   case:<CR><C-T><C-T>break;<CR><C-D><C-D>}<Esc>3k0f(la
imap  'st  struct <CR>{<CR>};<Esc>2kA
imap  're  return();<Esc>hi
imap  'ma int main(int argc, char *argv[])<CR>{<CR>}<Esc>O<C-T>return 0;<Esc>O
imap  'if  if (  )<CR>{<CR>}<Esc>2k0f(la
imap  'fo  for ( ; ; )<CR>{<CR>}<Esc>2k0f(a
imap  'en  enum  { };<Esc>4hi
imap  'el  else<CR>{   <CR>}<Esc>kA
imap  'ei  else if (  )<CR>{<CR>}<Esc>2k0f(la
imap  'do  do<CR>{   <CR>}  while (  );<Esc>kA
imap  'fl  float ;<Esc>i
imap  'df  default:<CR><C-T><CR>break;<Esc>kA
imap  'ca  case: <CR>break;<Esc>kA
imap  '//  ////////////<CR>//<CR>////////////<Esc>kA 
imap  '31  #! /bin/bash<CR><CR>

" useful latex editing shortcuts
map <F12> :!pdflatex %:p<CR>
imap '% %<CR>%---------------------------------<Esc>kA
imap 'f \subsection{}<CR>\begin{frame}{\insertsubsection}<CR><CR>\end{frame}<Esc>3k$i
