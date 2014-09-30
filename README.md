# Workspace.rb

Workspace is a tiny hack to remove the Desktop on OS X and replace it with a symlink to another directory on your filesystem.

## Motivation

- Keep the desktop clean, keep your projects clean as well
- Avoid using the desktop as a catch-all (but set ~/Downloads as your workspace once in a while)
- Use Exposé/Show Desktop instead of switching to Finder constantly
- Visually organize; Finder will remember your icon positions when you return to a workspace so use it to your advantage
- Applications often default to save new files to ~/Desktop; finally, it's where your work should go!

## Tips

- Create an Alfred shell script workflow with `/path/to/workflow.rb activate {query}` with the keyword *ww* for fast workspace switching
- Create a GeekTool shell geeklet to run `workspace.rb current` and display the path of the current workspace
- Disks, servers, etc. will still appear according to Finder preferences

## Install & Usage

```
cd /where/you/keep/scripts
git clone https://github.com/ianclarksmith/workspace.git
cd workspace
chmod +x workspace.rb
```

Activate a workspace:
> workspace.rb activate ~/Projects/YourAwesomeProject

*Note: Your Desktop folder must be empty (except for .localized and .DS_Store, since those aren't important) before you can activate a workspace. That way you can't accidentally force the workspace to overwrite your precious clutter.*

Remove the workspace symlink, restore default OS X Desktop folder:
> workspace.rb deactivate

Print path of the current workspace:
> workspace.rb current

## License

Copyright © 2014, Ian Clark Smith <ian@sumisu.jp>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
