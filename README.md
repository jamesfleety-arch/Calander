# Jotty Calendar — Umbrel App

A sleek monthly calendar that integrates with your self-hosted [Jotty](https://github.com/fccview/jotty) instance.

## What it does

- **Monthly calendar grid** with ← → navigation and today highlighted
- **Click any date** → side panel opens showing all tasks for that day
- **Add tasks** — they get pushed directly into your Jotty checklist via the REST API
- **Check/uncheck/delete** tasks in the panel; changes sync back to Jotty
- **Auto-sync every 30s** — tasks added from other devices appear automatically

## Jotty Integration

| Action | Jotty API |
|---|---|
| First run | Creates (or finds) checklist `📅 Calendar Tasks` |
| Add task | `POST /api/checklists/{id}/items` → `YYYY-MM-DD: task` |
| Check | `PUT .../items/{index}/check` |
| Uncheck | `PUT .../items/{index}/uncheck` |
| Delete | `DELETE .../items/{index}` |
| Load | `GET /api/checklists/{id}` + client-side date filtering |

## Setup

1. Enter your **Jotty URL** (e.g. `https://jotty.yourdomain.com`) and **API key** (`ck_...`) in the config bar at the top
2. Click **Save** — config persists in `localStorage`
3. Click any date to start adding tasks

Generate your API key in Jotty at: **Profile → Settings → API Key → Generate**

## Files

```
jotty-calendar-app/
├── umbrel-app.yml    # App manifest (name, description, version)
├── docker-compose.yml # Docker compose config (nginx web service)
├── Dockerfile         # Builds from nginx:alpine
├── exports.sh         # Environment exports (no shared services needed)
├── icon.png           # App icon (512x512, dark theme)
├── icon.svg           # Source icon (vector)
└── index.html         # The calendar app (self-contained, no build step)
```

## Development

The `index.html` is a fully self-contained single-file app — no build step, no dependencies. To test locally:

```bash
cd jotty-calendar-app
python3 -m http.server 8080
# Open http://localhost:8080
```

## License

MIT
