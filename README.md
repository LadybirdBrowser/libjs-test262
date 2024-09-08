# LibJS test262

Run the [Official ECMAScript Conformance Test Suite](https://github.com/tc39/test262) with [Ladybird](https://github.com/LadybirdWebBrowser/ladybird)'s [`LibJS`](https://github.com/LadybirdWebBrowser/ladybird/tree/master/Userland/Libraries/LibJS)

## Installation

First, clone and build [the Ladybird project](https://github.com/LadybirdBrowser/ladybird/blob/master/Documentation/BuildInstructionsLadybird.md).
To run test262, only the `test262-runner` Ladybird target needs to be built. From the Ladybird checkout, run:

```bash
./Meta/ladybird.sh build test262-runner
```

Then, in the libjs-test262 project, set up a virtual environment (optional) and install the script's dependencies:

```bash
virtualenv .venv
source .venv/bin/activate

pip3 install -r requirements.txt
```

Dependencies are:

- `tqdm` for displaying a progress bar

Finally, clone or sync test262 itself:

```bash
./sync-test262.sh
```

## Usage

In the below command, `LADYBIRD_SOURCE_DIR` should point to the Ladybird checkout. The exact path to `test262-runner`
may vary depending on any extra options that were provided to `ladybird.sh` above.

```bash
./main.py --libjs-test262-runner "${LADYBIRD_SOURCE_DIR}/Build/ladybird/bin/test262-runner" --test262-root ./test262
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

## Results

Test results are updated for every commit to the Ladybird repository. They may be viewed here:

https://ladybirdbrowser.github.io/libjs-website/test262/
