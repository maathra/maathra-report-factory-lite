# ReportFactory Lite

[![Latest release](https://img.shields.io/github/v/release/maathratnc/maathra-report-factory-lite?label=release&color=0aa)](https://github.com/maathratnc/maathra-report-factory-lite/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/maathratnc/maathra-report-factory-lite/total?color=0aa)](https://github.com/maathratnc/maathra-report-factory-lite/releases)
![Oracle APEX](https://img.shields.io/badge/Oracle%20APEX-ready-red)
![Java 8+](https://img.shields.io/badge/Java-8%2B-orange)
![Formats](https://img.shields.io/badge/output-PDF%20%C2%B7%20DOCX%20%C2%B7%20XLSX%20%C2%B7%20PPTX%20%C2%B7%20HTML%20%C2%B7%20RTF%20%C2%B7%20ODT-blue)
![Deploy](https://img.shields.io/badge/deploy-standalone%20jar%20%7C%20Tomcat%20war-555)

**Self-hosted document generation for Oracle APEX** — turn your APEX data into pixel-perfect
**PDF, Word, Excel, PowerPoint, HTML and more**, with no database connection and no internet access
required. (It works with any application that can make an HTTP call, but it's built with APEX in
mind.)

ReportFactory Lite ships with a ready-made **Oracle APEX companion app** and a PL/SQL API, so you
can generate and download documents straight from your APEX pages in minutes — pass page items as
report parameters, stream the result to the browser, and even password-protect PDFs.

- **Made for APEX:** a drop-in companion app + `arf_lite_util` PL/SQL API — call it from a process
  or a button and get the file back. See [`apex-companion-app/`](apex-companion-app/).
- **Self-hosted & private:** a single executable JAR with an embedded web server (just a Java 8+
  runtime), or a WAR for your own Apache Tomcat 9. No cloud, nothing leaves your network — ideal for
  on-prem and air-gapped environments.
- **Simple API:** design a template once, POST your data as JSON to one HTTP endpoint, and get the
  rendered document back in the format you ask for.
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

## Oracle APEX integration

The fastest way to produce documents from your APEX apps:

- [**`apex-companion-app/`**](apex-companion-app/) — an installable Oracle APEX application
  ([`arflite-apex-app.sql`](apex-companion-app/arflite-apex-app.sql)) plus setup notes in its
  [README](apex-companion-app/README.md).

From APEX you register a report, pass parameters from page items, call the service, and download the
result — **PDF, Word, Excel or PowerPoint** — with optional **PDF password protection**. Point the
companion app at your ReportFactory Lite instance and you're generating documents from a button or
page process.

---

## Download

Get the ready-to-run bundle from the [**Releases**](../../releases/latest) page:

| File | Use |
|---|---|
| `report-factory-lite-<version>.zip` | **The complete bundle** — unzip and run. Contains both the standalone JAR and the Tomcat WAR, plus config, sample templates, sample data and docs. |

Verify your download against the bundled checksums:

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

See [`report-engine/QUICKSTART.txt`](report-engine/QUICKSTART.txt) for the essentials and
[`report-engine/USER-GUIDE.md`](report-engine/USER-GUIDE.md) for the full manual (configuration, all
output formats, the File Console, HTTPS/TLS, Tomcat deployment and licensing).

## What's in this repository

- [`apex-companion-app/`](apex-companion-app/) — Oracle APEX companion app + install script
- [`report-engine/config/application.properties`](report-engine/config/application.properties) — the configuration template
- [`report-engine/templates/`](report-engine/templates/) — sample compiled report templates (`.jasper`) + images
- [`report-engine/sample-data/`](report-engine/sample-data/) — example JSON payloads for the sample templates
- [`report-engine/run.sh`](report-engine/run.sh) / [`report-engine/run.bat`](report-engine/run.bat) — launch scripts
- [`report-engine/USER-GUIDE.md`](report-engine/USER-GUIDE.md), [`report-engine/QUICKSTART.txt`](report-engine/QUICKSTART.txt) — documentation
- [`report-engine/THIRD-PARTY-NOTICES.md`](report-engine/THIRD-PARTY-NOTICES.md) — open-source attributions

The application binaries themselves are attached to each [Release](../../releases), not stored in
git.

## Licensing

ReportFactory Lite runs in **Trial** mode out of the box (report generation capped at 15/hour, a
fixed limit). For unlimited use, open `http://<your-host>:8080/unique-key` and email the shown
instance id to **sales@maathra.com** to receive a licence key (verified fully offline — no
internet needed). Paste it into `config/application.properties` and restart.
