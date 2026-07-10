# Completed Site Photos

Photos in this folder are shown on **photo-library.html** (the 📷 Photo Library tab).

## How to add photos

Put each project's photos in its own subfolder named after the project number, then commit and push:

```
photos/
  P2023-0012/
    kitchen-01.jpg
    facade-02.jpg
  P2024-0009/
    bathroom-01.jpg
```

- Supported formats: jpg / jpeg / png / webp / gif / bmp / avif
- The page scans this folder automatically via the GitHub API — no index file to maintain.
- Material/product labels are added in the browser (click a photo) and stored in `photo-labels.json` at the repo root. That file is managed only by the page's client-side JS via the GitHub API — never edit it by hand or overwrite it with git.
- Keep individual files under ~10 MB (GitHub Pages serves them directly); resize very large originals before committing.
