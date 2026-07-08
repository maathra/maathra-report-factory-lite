# ReportFactory Lite — User Guide

Turn a JSON payload into a pixel‑perfect document (PDF, Word, Excel and more) from a
self‑hosted service. No database connection, no internet required.

- **What it is:** a standalone Java service built on the JasperReports libraries. You design a
  template once, then call an HTTP endpoint with your data as JSON and get back the rendered
  document in the format you ask for.
- **How it runs:** a single executable JAR with an embedded web server. Just a Java runtime is
  needed — no application server to install. (A Tomcat‑deployable WAR can also be produced.)

---

## 1. Requirements

- **Java 8 or newer** (JRE is enough) on the host.
- The application archive: `report-factory-lite##<build>.jar`.
- A **root folder** for the engine’s data (templates, output, logs, config).
- To *design* templates: **Jaspersoft Studio** (design against a JSON data source).

---

## 2. Install & run

### 2.1 What you download

The download is a single self-contained folder — the application, the launch scripts, and all of
the data folders live together. Unzip it anywhere:

```
report-engine/                        ← the bundle (this whole folder is the "root")
├─ report-factory-lite-<version>.jar  ← the application
├─ run.sh                             ← start script (Linux/macOS)
├─ run.bat                            ← start script (Windows)
├─ SHA256SUMS.txt                     ← checksums
├─ config/
│  └─ application.properties          ← your configuration
├─ templates/                         ← compiled templates (<name>.jasper)
│  └─ other-assets/images/            ← images used by templates ("assets")
├─ reports/                           ← generated files land here (auto-cleaned by default)
├─ logs/                              ← application logs (daily-rolled)
├─ lib/                               ← optional: extra jars (fonts, barcode libs, …)
└─ sample-data/                       ← example JSON payloads for the sample templates
```

Throughout this guide, `<root>` means this folder.

### 2.2 Start the service

From inside the folder, no arguments needed:

**Linux / macOS**
```bash
cd report-engine
./run.sh
```

**Windows**
```bat
cd report-engine
run.bat
```

`run.sh` / `run.bat` automatically use their own folder as the root — so the bundle is portable
(unzip it anywhere and run). It loads `config/application.properties`, adds `lib/` to the classpath,
and starts the embedded web server. Open **http://localhost:8099/** (or your configured port) to
confirm it is running.

- To keep the **data folders elsewhere**, pass the root explicitly: `./run.sh /data/report-engine`.
- Set memory with `JAVA_OPTS`, e.g. `JAVA_OPTS="-Xmx1g" ./run.sh`.

> The script also supervises the process: if you trigger a restart from the console it relaunches
> automatically. To run unattended, wrap it in `systemd` (Linux) or a Windows service.

### 2.3 Deploy to Apache Tomcat (alternative to the standalone jar)

If you run your own application server, deploy the **WAR** build (`report-factory-lite-<version>.war`,
supplied by Maathra) instead of the jar. In this mode Tomcat provides the web server, and there is
no `run.sh`, so a couple of things are configured differently.

**Compatibility — read first**
- Use **Apache Tomcat 9.x** (Servlet 4 / `javax.*`). **Tomcat 10+ will not work** — it uses the
  `jakarta.*` namespace, which this build does not target.
- Java **8 or newer**.

**Step 1 — Prepare the data folder.** On the server create a root folder (any location), e.g.
`/opt/report-engine`, with your `config/application.properties` and the data sub-folders:
```
/opt/report-engine/
├─ config/application.properties
├─ templates/   (+ other-assets/images/)
├─ reports/
└─ logs/
```
(You can copy these from the standalone bundle; you do **not** need the jar or run scripts here.)

**Step 2 — Point Tomcat at your config.** Tomcat won’t pass the config location for you, so set it
as a JVM option. Create/edit `$CATALINA_BASE/bin/setenv.sh` (Linux/macOS):
```sh
export CATALINA_OPTS="$CATALINA_OPTS \
  -Dspring.config.additional-location=file:/opt/report-engine/config/ \
  -Dmaathra.rfl.root=/opt/report-engine"
```
Windows — `$CATALINA_BASE\bin\setenv.bat`:
```bat
set "CATALINA_OPTS=%CATALINA_OPTS% -Dspring.config.additional-location=file:C:/report-engine/config/ -Dmaathra.rfl.root=C:/report-engine"
```
> ⚠ **Without this, the war runs on the built-in demo defaults packaged inside it** (trial mode,
> `api-key=key`, root = Tomcat’s working directory) — not your configuration.

**Step 3 — Deploy the war.** Copy it into `$CATALINA_BASE/webapps/`. **The war’s file name becomes
the URL context path**, and every endpoint (report API, landing page, File Console, `/status`,
`/unique-key`) works under that context automatically:

| War file name | Base URL | Example endpoints |
|---|---|---|
| `ROOT.war` | `http://host/` | `/export`, `/console`, `/status` |
| `arfl.war` | `http://host/arfl/` | `/arfl/export`, `/arfl/console`, `/arfl/status` |

```
cp report-factory-lite-<version>.war  $CATALINA_BASE/webapps/arfl.war
```
Use whatever context name you like; just prefix your API calls and browser URLs with it
(e.g. call `POST http://host/arfl/export`).

**Step 4 — Add extra jars (if any).** Custom fonts, barcode libraries and other JasperReports
extension jars go in **`$CATALINA_BASE/lib/`**. (The `<root>/lib/` + `-Dloader.path` mechanism is for
the standalone jar only.)

**Step 5 — Start / restart Tomcat** (`$CATALINA_BASE/bin/startup.sh`, or restart the service) and
open `http://<host>:8080/` (or your Tomcat port) to confirm it is running.

**Tomcat-mode notes**
- The HTTP **port** is Tomcat’s (`server.port` in `application.properties` is ignored).
- **Disable console restart:** set `maathra.rfl.console.restart-enabled=false`. Under Tomcat a
  “restart” would terminate the whole Tomcat JVM (all applications), not just this app. To load
  newly-added jars, restart Tomcat yourself.
- Everything else — report generation, the File Console, licensing — works the same as the
  standalone jar.

---

## 3. Configuration

All settings live in `<root>/config/application.properties`. Every product property uses the
`maathra.rfl.*` namespace. **Restart the service after changing configuration.**

| Property | Default | Description |
|---|---|---|
| `server.port` | `8080` | HTTP port. Ports < 1024 (e.g. 80) require elevated privileges. |
| `maathra.rfl.root` | *(set by run.sh)* | Root folder holding `templates/`, `reports/`, `logs/`, `lib/`. `run.sh`/`run.bat` set it to the bundle folder automatically; only set it here to force a different absolute path. No trailing separator. |
| `maathra.rfl.api-key` | `key` | Key callers must send in the `X-API-KEY` header to generate reports. **Change this.** |
| `maathra.rfl.license-key` | *(empty)* | Your licence key (see [Licensing](#7-licensing)). Empty = Trial mode. |
| `maathra.rfl.report.persist-output` | `false` | `false` = delete each generated file right after it is returned (recommended). `true` = keep every file (you must clean the folder). |
| `maathra.rfl.log.retention-days` | `30` | Days of daily‑rolled logs to keep; older logs are deleted automatically. |
| `maathra.rfl.aes.enabled` | `0` | `0` = request body is plain JSON. `1` = body is AES‑256‑CBC encrypted (hex). See [4.4](#44-encrypted-payloads-optional). |
| `maathra.rfl.aes.encryption-key` | *(demo)* | 64 hex chars (256‑bit) AES key. **Change this** if you enable encryption. |
| `maathra.rfl.aes.encryption-iv` | *(demo)* | 32 hex chars (128‑bit) AES IV. **Change this** if you enable encryption. |

Console settings are in [section 6](#6-file-console).

> **Security:** change `api-key` and (if used) the AES key/IV from their demo defaults, and run
> behind HTTPS in production. Anyone who can read this file can read these values, so protect it.

---

## 4. Generating reports

Send an HTTP `POST` to **`/export`** with your data as the request body.

### 4.1 Request

| Header | Required | Value |
|---|---|---|
| `X-API-KEY` | yes | Must equal `maathra.rfl.api-key`. |
| `reportFormat` | yes | Output format — see [4.3](#43-output-formats). |
| `reportTemplateMain` | yes | Template file name **without** the `.jasper` extension (must exist in `<root>/templates/`). |
| `Content-Type` | yes | `application/json` |
| `pdfPassword` | no | If set and the format is `PDF`, the PDF is password‑protected with this value. |

**Body:** the report data as JSON, wrapped in a top‑level `data` element:

```json
{ "data": { "customer": "Acme", "amount": 1200 } }
```
`data` may be an object (single record) or an array (list), matching how the template’s fields are
defined.

### 4.2 Example

```bash
curl -X POST http://localhost:8099/export \
  -H "X-API-KEY: your-api-key" \
  -H "Content-Type: application/json" \
  -H "reportFormat: PDF" \
  -H "reportTemplateMain: invoice" \
  --data-binary @invoice-data.json \
  -o invoice.pdf
```

Password‑protected PDF — add one header:
```bash
  -H "pdfPassword: open-sesame"
```

### 4.3 Output formats

Set `reportFormat` to one of:

| `reportFormat` | Output |
|---|---|
| `PDF` | PDF (optionally password‑protected) |
| `DOCX` | Microsoft Word |
| `EXCEL` | Microsoft Excel (`.xlsx`) |
| `PPTX` | Microsoft PowerPoint |
| `HTML` | HTML |
| `ODT` | OpenDocument Text |
| `RTF` | Rich Text Format |

The same template renders to any of these — no template change needed.

### 4.4 Encrypted payloads (optional)

For sensitive data over untrusted networks you can encrypt the request body:

- Set `maathra.rfl.aes.enabled=1` and configure `aes.encryption-key` / `aes.encryption-iv`.
- The caller encrypts the JSON body with **AES‑256‑CBC** using the same key/IV and sends it
  **hex‑encoded**. The service decrypts it before rendering.
- With `aes.enabled=0` (default), send plain JSON.

Running behind **HTTPS** is the simpler, recommended protection for data in transit.

### 4.5 Response & cleanup

On success the response body is the generated document, with
`Content-Disposition: attachment; filename=…`. By default the file is streamed and then removed
from `<root>/reports/` (set `persist-output=true` to keep copies). A bad API key returns `403`; a
missing template or render error returns an error with a message.

---

## 5. Templates & assets

1. **Design** the template in Jaspersoft Studio against a JSON data source, then **compile** it to a
   `.jasper` file.
2. **Deploy** it to `<root>/templates/`. The file name (minus `.jasper`) is what you pass as
   `reportTemplateMain`.
3. **Images** referenced by templates go in `<root>/templates/other-assets/images/` (the “assets”
   area).
4. **Custom fonts / extra libraries:** drop the jar(s) into `<root>/lib/` and restart.

Templates can be deployed by copying files directly, or over the web using the **File Console**.

---

## 6. File Console

A web page for managing template / asset / report / log / lib files without shell access.
The downloaded bundle ships with it **enabled** (so it works the moment you deploy) and with
**default keys** — change those keys before real use (see the warning at the end of this section).
To turn it off entirely, set `maathra.rfl.console.enabled=false`.

### 6.1 Enable it

```properties
maathra.rfl.console.enabled=true
maathra.rfl.console.base-path=/console
# Optionally restrict who can reach it (CIDR supported). Empty = any IP; set = only these.
maathra.rfl.console.allowed-ips=127.0.0.1/32,10.0.0.0/8
# Access keys (plaintext). auth-key unlocks the page; api-key authorises file operations.
maathra.rfl.console.auth-key=choose-a-strong-unlock-key
maathra.rfl.console.api-key=choose-a-strong-file-ops-key
```

Then browse to `http://<host>/console`, enter the two keys, and use the tabs.

### 6.2 What you can do

- **Templates / Assets / Reports / Logs / Lib** tabs: list, search (paged), and download files.
- **Upload** to Templates (`.jrxml`, `.jasper`), Assets (images), and Lib (`.jar`). Reports and Logs
  are download‑only by default.
- **Delete** (only if `maathra.rfl.console.delete-enabled=true`), with confirmation.
- **Restart service** (only if `maathra.rfl.console.restart-enabled=true`) — needed after uploading
  jars to `lib/`, since new jars load on restart. Works when the service runs under `run.sh` /
  `run.bat` (or a supervisor that relaunches on exit code 86).

### 6.3 Console settings

| Property | Default | Description |
|---|---|---|
| `maathra.rfl.console.enabled` | `false` | Master switch. Off ⇒ the console path returns 404. |
| `maathra.rfl.console.base-path` | `/console` | URL path the console is served under. |
| `maathra.rfl.console.allowed-ips` | *(empty)* | Allowed client IPs/CIDRs. Empty ⇒ any IP (restriction is opt-in); set to lock it down. |
| `maathra.rfl.console.trusted-proxies` | *(empty)* | Only honour `X-Forwarded-For` from these proxy IPs. |
| `maathra.rfl.console.auth-key` / `api-key` | *(empty)* | Access keys. Empty while enabled ⇒ all operations refused. Comma‑separate to rotate. |
| `maathra.rfl.console.<area>.upload` | templates/assets/lib `true`; reports/logs `false` | Whether an area accepts uploads. |
| `maathra.rfl.console.<area>.allowed-ext` | per area | Allowed upload extensions. |
| `maathra.rfl.console.max-file-size-mb` | `10` | Max upload size. |
| `maathra.rfl.console.delete-enabled` | `false` | Allow deletes from the console. |
| `maathra.rfl.console.overwrite-backup` | `true` | Back up a file (`name.bak-<timestamp>`) before overwriting. |
| `maathra.rfl.console.restart-enabled` | `false` | Allow relaunching the service from the console. |

> ⚠ **The console api‑key is server‑admin‑equivalent.** Uploaded templates and jars execute code on
> the server. Enable the console only behind **HTTPS**, restrict `allowed-ips` tightly, and use
> strong keys.

---

## 7. Licensing

ReportFactory Lite runs in one of two modes, both fully offline:

- **Trial** (no valid licence): all features work, but report generation is capped at **15 report generations per hour** (a fixed limit).
- **Licensed**: unlimited generation. A licence is **perpetual** and **bound to one server**.

### 7.1 Get a licence

1. On the server, open **`http://<host>/unique-key`** — it shows this server’s **instance ID**
   (with a Copy button). *(In Trial mode the landing page also has a “Get licence” button that
   prepares an e‑mail containing the ID.)*
2. Send the instance ID to **sales@maathra.com**.
3. Maathra returns a licence key bound to that server.

### 7.2 Apply it

```properties
maathra.rfl.license-key=<the key you received>
```
Restart the service. The header badge turns to **Licensed** and the rate limit is lifted. You can
confirm via `GET /status`.

### 7.3 Notes

- **One licence per server.** Each machine/VM has its own instance ID and needs its own licence.
- **Hardware changes:** replacing the network card or rebuilding the VM can change the instance ID
  and revert the server to Trial. A normal reboot, restart, or config change does **not**. If the
  ID changes, contact Maathra for a re‑issue.
- If a licence is present but not valid, `GET /status` / the header badge explains why:
  `MACHINE_MISMATCH` (issued for a different server), `EXPIRED`, or `INVALID`.

---

## 8. Logging

- Logs are written to `<root>/logs/report-factory-lite.log`, rolled daily
  (`report-factory-lite.YYYY-MM-DD.log`), and pruned after
  `maathra.rfl.log.retention-days` days.
- Every report request and console action is logged. Secrets (keys, licence, payload contents) are
  never logged.

---

## 9. Endpoints

| Method | Path | Purpose | Auth |
|---|---|---|---|
| `GET` | `/` | Landing / status page | none |
| `GET` | `/status` | JSON: mode, version, licence status, instance id | none |
| `GET` | `/unique-key` | This server’s instance id (HTML page or plain text) | none |
| `POST` | `/export` | Generate a report | `X-API-KEY` |
| `GET` | `/console` | File console (when enabled) | IP + console keys |

---

## 10. Security checklist

- [ ] Change `maathra.rfl.api-key` from the default.
- [ ] If using payload encryption, change the AES key/IV.
- [ ] Serve over **HTTPS** (API keys, `pdfPassword`, and console keys travel in headers).
- [ ] Keep the console **off** unless needed; when on, tighten `allowed-ips` and use strong keys.
- [ ] Protect `config/application.properties` (file permissions); it contains secrets.
- [ ] Restrict who can reach the service port at the network/firewall level.

---

## 11. Troubleshooting

| Symptom | Likely cause / fix |
|---|---|
| `403 Invalid API Key` on `/export` | `X-API-KEY` doesn’t match `maathra.rfl.api-key`. |
| `500 … Template file not found` | `reportTemplateMain` doesn’t match a `.jasper` in `<root>/templates/`. |
| `500` / JSON parse error | Body isn’t valid JSON, or `Content-Type: application/json` was omitted (the body then gets treated as form data). |
| `429 … trial limit` | Trial rate limit reached; wait for the hourly window or apply a licence. |
| Badge shows **Trial** despite a key | Check `GET /status` → `licenseStatus`: `MACHINE_MISMATCH` / `EXPIRED` / `INVALID`. |
| Console returns `404` | Console disabled, or you’re hitting the wrong `base-path`. |
| Console returns `403` | `allowed-ips` is set and your IP isn’t in it (clear it to allow any IP). |
| Console “Restart” doesn’t come back | Service isn’t running under `run.sh` / a supervisor. |
| Port won’t bind | Another process on the port, or a port < 1024 without privileges. |

---

## 12. Support

- **Sales / licensing:** sales@maathra.com
- **General:** contact@maathra.com
- **Product:** https://www.maathra.com/products/report-factory

© Maathra Technology and Consultancy Pvt. Ltd.
