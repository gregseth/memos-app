A Sinatra app for memos display
===============================


## Structure 


```mermaid
graph LR
C[memos<br><i>gregseth/memos</i>]
A[app<br><i>gregseth/memo-app</i>]
P(/public)
O[output] 

style O stroke-dasharray:10

A --> O
C --- A
A -.- P
P -.- O

click C "https://github.com/gregseth/bluegrasshopper"
click A "https://github.com/gregseth/bluegrasshopper-conf"
```


## Usage

### Editing a memo

Clone the « memos » repository, edit and push. A GitHub webhook is triggered, which will automatically update the repository on the server, making the edits available to the public.

### Adding new file to the ToC

First follow the same steps than for editing a memo. Then clone this repository and edit the `public/toc.json` file, providing:

-   the category name;
-   the file name;
-   the title of the link displayed on the table of contents;

Example:

```json
[ {
    "name":   "Category",
    "values": [ {
        "link":   "subdir/markdown_file.md",
        "lbl":    "Title 1",
    }, {
        "link":   "text_file.txt",
        "lbl":    "Title 2",
    } ]
} ]
```

Finally commit and push the changes, and let the GitHub webhook handle the update.
