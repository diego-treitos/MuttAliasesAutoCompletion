# MuttAliasesAutoCompletion
Auto Completion for contacts in a mutt aliases file

This plugin will get the contacts for a _mutt aliases file_ and autocomplete them in vim while you type inside the `To:`, `Cc:` and `Bcc:` headers.

# Installation

Install `git-lfs`.

Install the traditional way or just use _Plug_

```
Plug 'diego-treitos/MuttAliasesAutoCompletion'
```

# Configuration
Add `g:mutt_aliases_path` to your `.vimrc` with the path to your (neo)mutt _aliases file_

```

" Path to mutt aliases
let g:mutt_aliases_path = "~/.mutt/aliases"

```

# Demo

Also available in [webm video](https://media.githubusercontent.com/media/diego-treitos/MuttAliasesAutoCompletion/master/stuff/MuttAliasesAutoCompletion.webm)

![LSE Demo](https://media.githubusercontent.com/media/diego-treitos/MuttAliasesAutoCompletion/master/stuff/MuttAliasesAutoCompletion.gif)
