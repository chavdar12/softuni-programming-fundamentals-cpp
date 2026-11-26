#!/usr/bin/env bash
# CI for this repo, run from its root by .github/workflows/ci.yml:
#   bash ci.sh build cpp
#   bash ci.sh format clang-format
# Optional env (set in the workflow): SETUP
set -uo pipefail
mode=$1; shift
TMP=${RUNNER_TEMP:-$(mktemp -d)}
group() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::group::$1" || echo "== $1"; }
endgroup() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::endgroup::" || true; }
fail() { echo "${GITHUB_ACTIONS:+::error::}$1 failed"; status=1; }
# top-most folders holding one of the given marker files (nested ones are built by their parent)
tops() { find . \( -name node_modules -o -name build -o -name .git -o -name .venv \) -prune -o \( "$@" \) -print \
  | xargs -n1 dirname | sort -u | awk '{ for (i in top) if (index($0 "/", top[i] "/") == 1) next; top[NR] = $0; print }'; }
status=0
# parallel compile jobs: one per CPU (a bare -j is unlimited and runs out of memory on ASan builds)
jobs_n() { nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 2; }

if [ -n "${SETUP:-}" ] && [ "$mode" = build ]; then RUNNER_TEMP=$TMP bash -ec "$SETUP" || exit 1; fi

for kind in "$@"; do case "$mode:$kind" in
build:cpp)
  for dir in $(tops -name CMakeLists.txt); do
    group "$dir"
    ASAN_OPTIONS=detect_leaks=0 cmake -S "$dir" -B "$TMP/build/$dir" -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_CXX_FLAGS="-fsanitize=address,undefined -fno-sanitize-recover=undefined" \
      && cmake --build "$TMP/build/$dir" -j "$(jobs_n)" && ASAN_OPTIONS=detect_leaks=0 ctest --test-dir "$TMP/build/$dir" --output-on-failure -j "$(jobs_n)" || fail "$dir"
    endgroup
  done ;;
format:clang-format) git ls-files -z '*.cpp' '*.h' '*.hpp' | xargs -0 -r clang-format --dry-run -Werror || fail clang-format ;;
*) echo "unknown $mode kind: $kind" >&2; exit 2 ;;
esac; done
exit $status
