# My coding environment

## Principles

1. Fast and reliable editor (neovim)
2. (Almost) everything one keystroke away
3. I do not use AI
4. Easily portable environment

## How do I...?

### Search and grep

I use Telescope as a fuzzy finder.

- `<leader>sf`: Search files
- `<leader>sg`: Grep across the project

### Navigate within a file

I use vim motions to navigate. These are the most used ones:

- `<leader>u`: scroll up
- `<leader>d`: scroll down

### Navigate between files

I use harpoon to navigate between the 4-5 files I usually touch when working on a PR.

- `<leader>n`: Add current file as new entry to Harpoon
- `<leader>m`: Show harpoon menu
- `<leader>h`: Go to Harpoon file 1
- `<leader>j`: Go to Harpoon file 2
- `<leader>k`: Go to Harpoon file 3
- `<leader>l`: Go to Harpoon file 4
- `<leader>;`: Go to Harpoon file 5

### Execute tests

I use vim-test to execute tests, which runs the specified test in a tmux pane at the bottom of the screen.

- `<leader>t`: Run nearest test (cursor positioned in the test to execute)
- `<leader>T`: Run all tests in current file
- `<leader>L`: Run last executed test
- `<leader>v`: Visit last executed test (from anywhere in the code base)

### Use Git

I use Fugitive to create commits.

- `<leader>g`: Show Git Status
- `:G blame`: Show git blame
- `:G <any git command>`: To interact with git (e.g. `:G diff HEAD^`)

Inside Git Status:
- `-`: Move chunk/file between staged and unstaged OR push a commit
- `=`: Toggle expand of files
- `cc`: Commit
- `ca`: Append to commit

### Interact with GitHub

I use Octo to interact with GitHub and create PRs.

- `:Octo pr create`: Create a PR
- `:Octo pr list`: Find a PR to review
- `:Octo review start`: Start a review
- `:Octo comment add`: Add a comment
- `:Octo review submit`: Approve a PR

### Debug

Currently, I do not have any solution for an interactive debugger. However, for more than a year, I did not have the necessity to do so; `pdb` has worked just fine for me.
