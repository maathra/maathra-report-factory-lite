#!/usr/bin/env sh
#
# Start ReportFactory Lite as a standalone service (embedded Tomcat - no external
# Tomcat installation required).
#
# Usage:
#   ./run.sh [ROOT] [extra Spring args...]
#
# ROOT is the report-engine folder. It must contain:
#     config/application.properties      - configuration (loaded on startup)
#     templates/  reports/  logs/        - data folders
#     lib/                               - OPTIONAL: extra jars added to the classpath,
#                                          e.g. QR/barcode libraries, custom-font jars,
#                                          JasperReports extensions. This is the
#                                          standalone equivalent of Tomcat's lib/ folder.
#
# If ROOT is omitted it defaults to the folder this script lives in (the download bundle
# is self-contained: the jar, scripts, config/ and data folders all sit together). Override
# with an argument or the RFL_ROOT env var to keep data elsewhere.
# JAVA_OPTS is honoured (e.g. JAVA_OPTS="-Xmx1g").
#
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ROOT="${1:-${RFL_ROOT:-$SCRIPT_DIR}}"
if [ "$#" -gt 0 ]; then shift; fi
# Resolve ROOT to an absolute path so it works regardless of the current directory.
ROOT="$(cd "$ROOT" 2>/dev/null && pwd || echo "$ROOT")"

# Locate the application archive next to this script, then under target/.
WAR="$(ls "$SCRIPT_DIR"/report-factory-lite*.jar 2>/dev/null | grep -v '\.original' | head -1)"
if [ -z "$WAR" ]; then
  WAR="$(ls "$SCRIPT_DIR"/target/report-factory-lite*.jar 2>/dev/null | grep -v '\.original' | head -1)"
fi
if [ -z "$WAR" ]; then
  echo "ERROR: could not find report-factory-lite*.jar next to run.sh or under target/." >&2
  exit 1
fi

mkdir -p "$ROOT/lib" "$ROOT/reports" "$ROOT/logs"

echo "Starting ReportFactory Lite"
echo "  archive  : $WAR"
echo "  root     : $ROOT"
echo "  config   : $ROOT/config/"
echo "  ext libs : $ROOT/lib/  (drop extra jars here)"

# Supervisor loop: the app exits with code 86 when the console requests a restart
# (e.g. to load newly-uploaded jars from <root>/lib); relaunch on that code only.
# -Dloader.path adds <root>/lib to the classpath (PropertiesLauncher).
# Disable errexit here: a non-zero JVM exit must be read (not abort the script),
# otherwise the restart loop below can never inspect the exit code.
set +e
RESTART_CODE=86
while : ; do
  java ${JAVA_OPTS} \
    -Dloader.path="$ROOT/lib" \
    -jar "$WAR" \
    --spring.config.additional-location="file:$ROOT/config/" \
    --maathra.rfl.root="$ROOT" \
    "$@"
  code=$?
  if [ "$code" -eq "$RESTART_CODE" ]; then
    echo "ReportFactory Lite requested a restart - relaunching..."
    continue
  fi
  exit "$code"
done
