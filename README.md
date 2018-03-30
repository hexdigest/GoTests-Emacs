# GoUnit-Emacs [![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/hexdigest/GoUnit-Sublime/blob/master/LICENSE)

`GoUnit-Emacs` is a package for Emacs for automatically generating [table driven tests](https://github.com/golang/go/wiki/TableDrivenTests). It uses [`gounit`](https://github.com/hexdigest/gounit) to generate missing tests based on its target source files' function and method signatures. Any new dependencies in the test files are automatically imported.

## Demo

![demo](/gounit.gif)

## Installation

__Prequisite:__ Use [`go get`](https://golang.org/cmd/go/#hdr-Download_and_install_packages_and_dependencies) to install and update the `gounit` tool:
```sh
$ go get -u github.com/hexdigest/gounit/...
```

Next, copy GoUnit-Emacs in your .emacs directory
```
cd ~/.emacs.d
wget https://raw.githubusercontent.com/hexdigest/GoUnit-Emacs/master/gounit.el
```
In your .emacs add the following:
```
;; gounit
(add-to-list 'load-path "~/.emacs.d/")
(require 'gounit)
```

## Usage

Select some functions and run `M-x gounit-region`. This appends missing tests to an existing test file, or creates a new test file with them. To generate all missing tests use `M-x gounit`

## License

`GoUnit-Emacs` is released under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).
