
tmux-prefixless
================================================================================

Description
--------------------------------------------------------------------------------

I hate using a prefix key with `tmux`.

Instead, I use `<alt-key>`. This feels intuitive because I hold down `<alt>` to
navigate to the session, then window, then pane. Then I release `<alt>`. This
enables me to effiently navigate tmux without using a prefix. I also don't like
`tmux`'s `repeat-time` option because relying on timing to enter commands is
error prone.

I use `<alt-h/j/k/l>` to switch panes, `<alt-H/L>` to switch windows,
and `<alt-J/K>` to switch sessions.

But what happens if you need to use the `<alt>` key for `emacs` or nested `tmux`
sessions?? I disable my keybindings with `<alt-i>` and re-enable them with `<alt-o>`.

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

