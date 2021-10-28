
tmux-prefixless
================================================================================

Description
--------------------------------------------------------------------------------

I hate using a prefix key with `tmux`.

Instead, I use `<alt-key>`. This feels intuitive because I hold down `<alt>` with
my thumb, to navigate to the session with `J`/`K`, then window with `H`/`L`, then
pane with `h`/`j`/`k`/`l`. Then I release `<alt>`. This enables me to effiently
navigate tmux without using a prefix. I also don't like `tmux`'s `repeat-time`
option because relying on timing to enter commands is error-prone.

But what happens when I need to use the `<alt>` key for `emacs` or nested `tmux`
sessions? First of all, I use `vim` instead of `emacs`. Secondly, I can disable
my keybindings with `<alt-i>` and re-enable them with `<alt-o>`.

[//]: # (TODO: Write a better description.)
[//]: # (TODO: Add gif.)


Installation
--------------------------------------------------------------------------------

### Via TPM (recommended)

``` tmux
set -g @plugin 'toddyamakawa/tmux-prefixless'
```

[//]: # (TODO: Add mannual installation.)


Usage
--------------------------------------------------------------------------------
For a list of keyboard shortcuts, simply run:

```sh
tmux list-keys -T prefixless
```


About
--------------------------------------------------------------------------------

### Author
[toddyamakawa](https://github.com/toddyamakawa)

### License
[MIT](LICENSE.md)

