{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    settings = { ignorecase = true; };
    extraConfig = ''
      " Enable filetype plugins
      filetype plugin on
      filetype indent on

      " Set to auto read when a file is changed from the outside
      set autoread
      au FocusGained,BufEnter * silent! checktime

      " With a map leader it's possible to do extra key combinations
      " like <leader>w saves the current file
      let mapleader = ","

      " Fast saving
      nmap <leader>w :w!<cr>

      " :W sudo saves the file
      " (useful for handling the permission-denied error)
      command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

      " Turn on the Wild menu
      set wildmenu

      " Always show current position
      set ruler

      " Height of the command bar
      set cmdheight=1

      " A buffer becomes hidden when it is abandoned
      set hid

      " Configure backspace so it acts as it should act
      set backspace=eol,start,indent
      set whichwrap+=<,>,h,l

      " Ignore case when searching
      set ignorecase

      " When searching try to be smart about cases
      set smartcase

      " Highlight search results
      set hlsearch

      " Makes search act like search in modern browsers
      set incsearch

      " Don't redraw while executing macros (good performance config)
      set lazyredraw

      " For regular expressions turn magic on
      set magic

      " Show matching brackets when text indicator is over them
      set showmatch

      " How many tenths of a second to blink when matching brackets
      set mat=2

      " No annoying sound on errors
      set noerrorbells
      set novisualbell
      set t_vb=
      set tm=500

      " Enable syntax highlighting
      syntax enable

      " Set regular expression engine automatically
      set regexpengine=0

      " Enable 256 colors palette in Gnome Terminal
      if $COLORTERM == 'gnome-terminal'
        set t_Co=256
      endif

      set background=dark

      " Set utf8 as standard encoding and en_US as the standard language
      set encoding=utf8

      " Use spaces instead of tabs
      set expandtab

      " Be smart when using tabs ;)
      set smarttab

      " 1 tab == 4 spaces
      set shiftwidth=4
      set tabstop=4

      set ai "Auto indent
      set si "Smart indent
      set wrap "Wrap lines

      set nu
      set mouse=a
    '';
  };
}
