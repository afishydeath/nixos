{
  # line numbers
  number = true;
  relativenumber = true;
  ## how should warnings on the left side be displayed? number overrides that line number
  signcolumn = "number";

  # clipboard options
  clipboard = {
    providers = {
      wl-copy.enable = true;
      xsel.enable = true;
    };
    ## sync os and nixvim clipboard
    register = "unnamedplus";
  };

  # file preservation
  ## undo history
  undofile = true;
  ## ms between recovery saves
  updatetime = 250;

  # indentation
  ## line wrapping stays indented
  breakindent = true;
  ## preserve indent where possible
  preserveindent = true;
  ## spaces to tabs
  shiftwidth = 2;
  tabstop = 2;
  softtabstop = 2;

  # searching
  ## searching is case insensitive unless caps in search or \C
  ignorecase = true;
  smartcase = true;
  ## substitution preview
  inccommand = "split";
  ## highlight previous search
  hlsearch = true;

  # appearance
  ## display whitespace
  list = true;
  ### map how to display whitespace
  listchars = ",nbsp:⎵,trail:·";
  ### show tab line
  showtabline = 2;
  ## show the line the cursor is on
  cursorline = true;
  ## minimum lines of code to show when scrolling
  scrolloff = 10;
  ## allow full colour
  termguicolors = true;
  ## set window title to filename
  title = true;

  # general
  ## enable mouse
  mouse = "a";
  ## showmode functionality covered by lualine
  showmode = false;
  ## ms wait for mapped sequence
  ### used for which-key
  timeoutlen = 300;
  ## where can split windows go
  splitbelow = true;
  splitright = true;

}
