--Colour palette
Palette = {
	es_green  = {162, 192, 55},
	es_blue   = {46, 63, 87},
	White     = {255, 255, 255},
	Black     = {0, 0, 0},
	Red       = {255, 0, 0},
	Green     = {0, 255, 0}
}

-- Logos
ES_logo_full = "iVBORw0KGgoAAAANSUhEUgAAAGYAAAAjCAYAAABmSn+9AAAFY2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjEwMiIKICAgZXhpZjpQaXhlbFlEaW1lbnNpb249IjM1IgogICBleGlmOkNvbG9yU3BhY2U9IjEiCiAgIHRpZmY6SW1hZ2VXaWR0aD0iMTAyIgogICB0aWZmOkltYWdlTGVuZ3RoPSIzNSIKICAgdGlmZjpSZXNvbHV0aW9uVW5pdD0iMiIKICAgdGlmZjpYUmVzb2x1dGlvbj0iNzIuMCIKICAgdGlmZjpZUmVzb2x1dGlvbj0iNzIuMCIKICAgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIKICAgcGhvdG9zaG9wOklDQ1Byb2Zp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"

Icon_Arrow_UpRt = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+Cjxzdmcgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDI1NiAyNTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgeG1sbnM6c2VyaWY9Imh0dHA6Ly93d3cuc2VyaWYuY29tLyIgc3R5bGU9ImZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2UtbWl0ZXJsaW1pdDoyOyI+CiAgICA8ZyB0cmFuc2Zvcm09Im1hdHJpeCgwLjE2MTU3MSwwLjE2MTMzOCwtMC4xNjEzMzgsMC4xNjE1NzEsMTQ1LjU1OSwtMy4zMTY3NSkiPgogICAgICAgIDxwYXRoIGQ9Ik0zNDAuNCwzMy42QzMzOC4yLDM0LjQgMzM0LjUsMzYuOSAzMzIuMywzOS4zQzMyOC40LDQzLjMgMzYuMiw0NTMuNSAzMy40LDQ1OC45QzMyLjYsNDYwLjMgMzIsNDY0LjQgMzIsNDY3LjlDMzIsNDc4LjkgMzguNiw0ODkuNiA0OCw0OTMuOUM1MS4xLDQ5NS4zIDYwLjQsNDk1LjYgMTI0LDQ5NkwxOTYuNSw0OTYuNUwxOTcuMSw1NTQuNUMxOTcuNCw1ODYuNCAxOTcuOCw2NzAuNSAxOTcuOSw3NDEuNUMxOTgsODMyLjMgMTk4LjMsODcxLjcgMTk5LjEsODc0LjVDMjAwLjYsODgwIDIwOC4yLDg4Ny40IDIxNCw4ODkuMUMyMTcuNyw4OTAuMyAyNDIuOCw4OTAuNSAzNTMuNSw4OTAuNUw0ODguNSw4OTAuNUw0OTMuMSw4ODguNEM0OTcuOCw4ODYuMiA1MDEuOCw4ODEuOSA1MDQuMiw4NzYuNUM1MDUuMyw4NzQuMSA1MDUuNiw4MzggNTA2LDY4NUw1MDYuNSw0OTYuNUw2NTIuNSw0OTUuNUw2NTYuNyw0OTMuM0M2NjguNSw0ODYuOSA2NzUuMyw0NjkuNiA2NzAuMiw0NTguOUM2NjcsNDUyLjIgMzc1LjksNDMuNiAzNzEsMzguOUMzNjcuNywzNS44IDM2NC43LDMzLjkgMzYxLjYsMzMuMUMzNTUuNiwzMS42IDM0NS40LDMxLjggMzQwLjQsMzMuNloiIHN0eWxlPSJmaWxsOndoaXRlOyIvPgogICAgPC9nPgo8L3N2Zz4K"

Icon_Arrow_DnRt = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+Cjxzdmcgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDI1NiAyNTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgeG1sbnM6c2VyaWY9Imh0dHA6Ly93d3cuc2VyaWYuY29tLyIgc3R5bGU9ImZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2UtbWl0ZXJsaW1pdDoyOyI+CiAgICA8ZyB0cmFuc2Zvcm09Im1hdHJpeCgtMC4xNjEzMzgsMC4xNjE1NzEsLTAuMTYxNTcxLC0wLjE2MTMzOCwyNTkuMzYyLDE2Ni4yMDYpIj4KICAgICAgICA8cGF0aCBkPSJNMzQwLjQsMzMuNkMzMzguMiwzNC40IDMzNC41LDM2LjkgMzMyLjMsMzkuM0MzMjguNCw0My4zIDM2LjIsNDUzLjUgMzMuNCw0NTguOUMzMi42LDQ2MC4zIDMyLDQ2NC40IDMyLDQ2Ny45QzMyLDQ3OC45IDM4LjYsNDg5LjYgNDgsNDkzLjlDNTEuMSw0OTUuMyA2MC40LDQ5NS42IDEyNCw0OTZMMTk2LjUsNDk2LjVMMTk3LjEsNTU0LjVDMTk3LjQsNTg2LjQgMTk3LjgsNjcwLjUgMTk3LjksNzQxLjVDMTk4LDgzMi4zIDE5OC4zLDg3MS43IDE5OS4xLDg3NC41QzIwMC42LDg4MCAyMDguMiw4ODcuNCAyMTQsODg5LjFDMjE3LjcsODkwLjMgMjQyLjgsODkwLjUgMzUzLjUsODkwLjVMNDg4LjUsODkwLjVMNDkzLjEsODg4LjRDNDk3LjgsODg2LjIgNTAxLjgsODgxLjkgNTA0LjIsODc2LjVDNTA1LjMsODc0LjEgNTA1LjYsODM4IDUwNiw2ODVMNTA2LjUsNDk2LjVMNjUyLjUsNDk1LjVMNjU2LjcsNDkzLjNDNjY4LjUsNDg2LjkgNjc1LjMsNDY5LjYgNjcwLjIsNDU4LjlDNjY3LDQ1Mi4yIDM3NS45LDQzLjYgMzcxLDM4LjlDMzY3LjcsMzUuOCAzNjQuNywzMy45IDM2MS42LDMzLjFDMzU1LjYsMzEuNiAzNDUuNCwzMS44IDM0MC40LDMzLjZaIiBzdHlsZT0iZmlsbDp3aGl0ZTsiLz4KICAgIDwvZz4KPC9zdmc+Cg=="

Icon_Arrow_DnLt = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+Cjxzdmcgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDI1NiAyNTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgeG1sbnM6c2VyaWY9Imh0dHA6Ly93d3cuc2VyaWYuY29tLyIgc3R5bGU9ImZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2UtbWl0ZXJsaW1pdDoyOyI+CiAgICA8ZyB0cmFuc2Zvcm09Im1hdHJpeCgtMC4xNjE1NzEsLTAuMTYxMzM4LDAuMTYxMzM4LC0wLjE2MTU3MSw4OS44MzkzLDI4MC4wMDgpIj4KICAgICAgICA8cGF0aCBkPSJNMzQwLjQsMzMuNkMzMzguMiwzNC40IDMzNC41LDM2LjkgMzMyLjMsMzkuM0MzMjguNCw0My4zIDM2LjIsNDUzLjUgMzMuNCw0NTguOUMzMi42LDQ2MC4zIDMyLDQ2NC40IDMyLDQ2Ny45QzMyLDQ3OC45IDM4LjYsNDg5LjYgNDgsNDkzLjlDNTEuMSw0OTUuMyA2MC40LDQ5NS42IDEyNCw0OTZMMTk2LjUsNDk2LjVMMTk3LjEsNTU0LjVDMTk3LjQsNTg2LjQgMTk3LjgsNjcwLjUgMTk3LjksNzQxLjVDMTk4LDgzMi4zIDE5OC4zLDg3MS43IDE5OS4xLDg3NC41QzIwMC42LDg4MCAyMDguMiw4ODcuNCAyMTQsODg5LjFDMjE3LjcsODkwLjMgMjQyLjgsODkwLjUgMzUzLjUsODkwLjVMNDg4LjUsODkwLjVMNDkzLjEsODg4LjRDNDk3LjgsODg2LjIgNTAxLjgsODgxLjkgNTA0LjIsODc2LjVDNTA1LjMsODc0LjEgNTA1LjYsODM4IDUwNiw2ODVMNTA2LjUsNDk2LjVMNjUyLjUsNDk1LjVMNjU2LjcsNDkzLjNDNjY4LjUsNDg2LjkgNjc1LjMsNDY5LjYgNjcwLjIsNDU4LjlDNjY3LDQ1Mi4yIDM3NS45LDQzLjYgMzcxLDM4LjlDMzY3LjcsMzUuOCAzNjQuNywzMy45IDM2MS42LDMzLjFDMzU1LjYsMzEuNiAzNDUuNCwzMS44IDM0MC40LDMzLjZaIiBzdHlsZT0iZmlsbDp3aGl0ZTsiLz4KICAgIDwvZz4KPC9zdmc+Cg=="

Icon_Arrow_UpLt = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+Cjxzdmcgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDI1NiAyNTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgeG1sbnM6c2VyaWY9Imh0dHA6Ly93d3cuc2VyaWYuY29tLyIgc3R5bGU9ImZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2UtbWl0ZXJsaW1pdDoyOyI+CiAgICA8ZyB0cmFuc2Zvcm09Im1hdHJpeCgwLjE2MTMzOCwtMC4xNjE1NzEsMC4xNjE1NzEsMC4xNjEzMzgsLTIzLjk2MzIsMTEwLjQ4NikiPgogICAgICAgIDxwYXRoIGQ9Ik0zNDAuNCwzMy42QzMzOC4yLDM0LjQgMzM0LjUsMzYuOSAzMzIuMywzOS4zQzMyOC40LDQzLjMgMzYuMiw0NTMuNSAzMy40LDQ1OC45QzMyLjYsNDYwLjMgMzIsNDY0LjQgMzIsNDY3LjlDMzIsNDc4LjkgMzguNiw0ODkuNiA0OCw0OTMuOUM1MS4xLDQ5NS4zIDYwLjQsNDk1LjYgMTI0LDQ5NkwxOTYuNSw0OTYuNUwxOTcuMSw1NTQuNUMxOTcuNCw1ODYuNCAxOTcuOCw2NzAuNSAxOTcuOSw3NDEuNUMxOTgsODMyLjMgMTk4LjMsODcxLjcgMTk5LjEsODc0LjVDMjAwLjYsODgwIDIwOC4yLDg4Ny40IDIxNCw4ODkuMUMyMTcuNyw4OTAuMyAyNDIuOCw4OTAuNSAzNTMuNSw4OTAuNUw0ODguNSw4OTAuNUw0OTMuMSw4ODguNEM0OTcuOCw4ODYuMiA1MDEuOCw4ODEuOSA1MDQuMiw4NzYuNUM1MDUuMyw4NzQuMSA1MDUuNiw4MzggNTA2LDY4NUw1MDYuNSw0OTYuNUw2NTIuNSw0OTUuNUw2NTYuNyw0OTMuM0M2NjguNSw0ODYuOSA2NzUuMyw0NjkuNiA2NzAuMiw0NTguOUM2NjcsNDUyLjIgMzc1LjksNDMuNiAzNzEsMzguOUMzNjcuNywzNS44IDM2NC43LDMzLjkgMzYxLjYsMzMuMUMzNTUuNiwzMS42IDM0NS40LDMxLjggMzQwLjQsMzMuNloiIHN0eWxlPSJmaWxsOndoaXRlOyIvPgogICAgPC9nPgo8L3N2Zz4K"