# Oracle APEX Companion App

A ready-made Oracle APEX application that integrates with **ReportFactory Lite** so you can
generate and download documents — **PDF, Word, Excel, PowerPoint and more** — directly from your
APEX pages.

## ▶ Watch the demo

See how it's integrated with Oracle APEX: **https://www.youtube.com/watch?v=dNOFvYimYqk**

## What's here

- [`arflite-apex-app.sql`](arflite-apex-app.sql) — the installable APEX application export.

## Install

1. In **App Builder → Import**, import [`arflite-apex-app.sql`](arflite-apex-app.sql) and install it
   into your workspace.
2. Point the app at your running ReportFactory Lite instance (base URL and API key).
3. Register a report, then generate it from a page process or button.

## What it does

From APEX you register a report, pass **page items as report parameters**, call the service, and
stream the result back to the browser — with optional **PDF password protection**. The document is
rendered by your self-hosted ReportFactory Lite instance; no data leaves your network.

## More

- Main project & downloads: [ReportFactory Lite](../README.md)
- Full manual: [`report-engine/USER-GUIDE.md`](../report-engine/USER-GUIDE.md)
- Questions / licensing: **sales@maathra.com**
