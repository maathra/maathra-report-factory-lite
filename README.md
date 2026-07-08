# ReportFactory Lite

[![Latest release](https://img.shields.io/github/v/release/maathra/maathra-report-factory-lite?label=release&color=0aa)](https://github.com/maathra/maathra-report-factory-lite/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/maathra/maathra-report-factory-lite/total?color=0aa)](https://github.com/maathra/maathra-report-factory-lite/releases)
![Java 8+](https://img.shields.io/badge/Java-8%2B-orange)
![Formats](https://img.shields.io/badge/output-PDF%20%C2%B7%20DOCX%20%C2%B7%20XLSX%20%C2%B7%20PPTX%20%C2%B7%20HTML%20%C2%B7%20RTF%20%C2%B7%20ODT-blue)
![Deploy](https://img.shields.io/badge/deploy-standalone%20jar%20%7C%20Tomcat%20war-555)

Turn a JSON payload into a pixel-perfect document — **PDF, Word, Excel, PowerPoint, HTML and
more** — from a self-hosted service. No database connection and no internet access required.

- **Self-hosted:** a single executable JAR with an embedded web server (just a Java 8+ runtime
  is needed), or a WAR for your own Apache Tomcat 9.
- **Simple API:** design a template once, then POST your data as JSON to one HTTP endpoint and
  get the rendered document back in the format you ask for.
- **Batteries included:** sample templates, sample payloads, a built-in File Console for managing
  templates/assets, and optional PDF password protection.

© Maathra Technology and Consultancy Pvt. Ltd. ReportFactory Lite is proprietary software; this
repository provides the runnable distribution, documentation and samples.

#### Landing Page
<img width="1470" height="886" alt="image" src="https://github.com/user-attachments/assets/93004e14-a4c8-491e-b8f2-672b0378c860" />
#### Console Unlock
<img width="1469" height="882" alt="image" src="https://github.com/user-attachments/assets/d5524746-5a0c-4347-8d11-b4af28de6bbf" />
#### Console
<img width="1470" height="883" alt="image" src="https://github.com/user-attachments/assets/2176fd3b-b6ba-4d87-85a9-a339e1d93270" />
#### API Call
<img width="1470" height="956" alt="image" src="https://github.com/user-attachments/assets/c30a977f-0ada-4750-85b0-e2cad74c5201" />

---

## Download

Get the ready-to-run bundle from the [**Releases**](../../releases/latest) page:

| File | Use |
|---|---|
| `report-factory-lite-<version>.zip` | Full standalone bundle — unzip and run (recommended) |
| `report-factory-lite-<version>.jar` | Just the standalone application |
| `report-factory-lite-<version>.war` | For deploying into external Apache Tomcat 9.x |

Verify your download against [`SHA256SUMS.txt`](SHA256SUMS.txt):

```bash
shasum -a 256 -c SHA256SUMS.txt
```

## Quick start

```bash
unzip report-factory-lite-<version>.zip
cd report-engine
./run.sh            # run.bat on Windows   (Java 8+ required)
```

Then open <http://localhost:8080/> and generate a report:

```bash
curl -X POST http://localhost:8080/export \
  -H "X-API-KEY: key" \
  -H "Content-Type: application/json" \
  -H "reportFormat: PDF" \
  -H "reportTemplateMain: arfl-demo-invoice" \
  --data-binary @sample-data/arfl-demo-invoice.json \
  -o invoice.pdf
```

See [QUICKSTART.txt](QUICKSTART.txt) for the essentials and [USER-GUIDE.md](USER-GUIDE.md) for the
full manual (configuration, all output formats, the File Console, Tomcat deployment and licensing).

## What's in this repository

- [`config/application.properties`](config/application.properties) — the configuration template
- [`templates/`](templates/) — sample compiled report templates (`.jasper`) + images
- [`sample-data/`](sample-data/) — example JSON payloads for the sample templates
- `run.sh` / `run.bat` — launch scripts
- [`USER-GUIDE.md`](USER-GUIDE.md), [`QUICKSTART.txt`](QUICKSTART.txt) — documentation
- [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md) — open-source attributions

The application binaries themselves are attached to each [Release](../../releases), not stored in
git.

## Licensing

ReportFactory Lite runs in **Trial** mode out of the box (report generation capped at 15/hour, a
fixed limit). For unlimited use, open `http://<your-host>:8080/unique-key` and email the shown
instance id to **sales@maathra.com** to receive a licence key (verified fully offline — no
internet needed). Paste it into `config/application.properties` and restart.
