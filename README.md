# LibJS test262

> Run the [Official ECMAScript Conformance Test Suite](https://github.com/tc39/test262) with [Ladybird](https://github.com/LadybirdWebBrowser/ladybird)'s [`LibJS`](https://github.com/LadybirdWebBrowser/ladybird/tree/master/Userland/Libraries/LibJS)

## Installation

Install `git`, `cmake`, `ninja`, `gcc`/`clang` and `python3` (3.9+).

To install the script's dependencies, run:

```console
pip3 install -r requirements.txt
```

Dependencies are:

- `tqdm` for displaying a progress bar

## Usage

To clone test262, clone ladybird and build Lagom run:

```console
./setup.sh
```

The repositories will only be cloned if they don't exist yet locally.
If `LADYBIRD_SOURCE_DIR` is set, it will be used to compile the runner instead of cloning ladybird.

Once that's done, run:

```console
python3 main.py --libjs-test262-runner ./Build/bin/test262-runner --test262-root ./test262/
```

## Options

```text
usage: main.py [-h] -j PATH [-t PATH] [-p PATTERN] [-c CONCURRENCY] [--timeout TIMEOUT] [--memory-limit MEMORY_LIMIT] [--json] [--per-file PATH] [-s | -v] [-f] [--parse-only] [--ignore IGNORE] [--forward-stderr] [--summary] [--debug]

Run the test262 ECMAScript test suite with Ladybird's LibJS

options:
  -h, --help            show this help message and exit
  -j PATH, --libjs-test262-runner PATH
                        path to the 'test262-runner' binary
  -t PATH, --test262-root PATH
                        path to the 'test262' directory
  -p PATTERN, --pattern PATTERN
                        glob pattern used for test file searching (defaults to test/**/*.js)
  -c CONCURRENCY, --concurrency CONCURRENCY
                        number of concurrent workers (defaults to number of CPU cores)
  --timeout TIMEOUT     timeout for each test run in seconds (defaults to 10)
  --memory-limit MEMORY_LIMIT
                        memory limit for each test run in megabytes (defaults to 512)
  --json                print the test results as JSON
  --per-file PATH       output per-file results to file
  -s, --silent          don't print any progress information
  -v, --verbose         print output of test runs
  -f, --fail-only       only show failed tests
  --parse-only          only parse the test files and fail/pass based on that
  --ignore IGNORE       ignore any tests matching the glob
  --forward-stderr      forward all stderr output to the stderr of the script
  --summary             only show the top level results
  --debug               enable debug logging of the runner
```

## Current status

Most of the tests run to completion and yield correct results. Few of the test
harness files do not parse yet or generate runtime errors, those are listed in
the results under a separate category, as are tests that fail to parse their
metadata, time out, or crash the engine (todo assertion failures, mostly).
