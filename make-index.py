#!/usr/bin/env python3
import re
from pathlib import Path

here = Path(__file__).parent.resolve()
pattern = re.compile(r"^(\d{2})-(e\d{4})$")


htmls = []

for path in here.glob("*.html"):
    match = pattern.match(path.stem)
    if not match:
        continue

    rank_str, ecode = match.groups()
    rank = int(rank_str.removeprefix("0"))  # type: ignore

    htmls.append((rank, ecode, path))

htmls.sort()


print(
    r"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width" />
    <style>
@media (prefers-color-scheme: light) {
  :root {
    --fg-color: black;
    --bg-color: white;
  }
}

@media (prefers-color-scheme: dark) {
  :root {
    --fg-color: #efefef;
    --bg-color: #1E232B;
  }
  pre {
    filter: saturate(1000%);
  }
}

body {
  max-width: 40rem;
  margin-inline: auto;
  font-family: system-ui;
  color: var(--fg-color);
  background-color: var(--bg-color);
}
pre {
  padding: 1rem;
  overflow-x: clip;
  white-space: pre-wrap;
}
    </style>
</head>
<body>
"""
)

for rank, ecode, html_path in htmls:
    print(f"<h1>{rank}. {ecode}</h1>")
    print(html_path.read_text())

print(
    r"""
</body>
</html>
"""
)
