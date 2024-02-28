(define-module (ucore packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)

  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages admin))

(define-public python-avocado-framework
  (package
    (name "python-avocado-framework")
    (version "103.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "avocado-framework" version))
       (sha256
        (base32 "1ysa0nj20ydx7kq12x8f7gm2yk9qaqj7ww4f3m7v0w1ijsjg4im5"))))
    (build-system python-build-system)
    (arguments
     (list
      ;; The test suite hangs, due to a serious bug in Python/Avocado (see:
      ;; https://github.com/avocado-framework/avocado/issues/4935).
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-paths
            (lambda* (#:key native-inputs inputs #:allow-other-keys)
              ;; These are runtime dependencies (inputs).
              (substitute* "avocado/plugins/spawners/podman.py"
                (("default='/usr/bin/podman'")
                 "default='podman'"))
              (substitute* "avocado/utils/podman.py"
                (("\"/usr/bin/env\", \"python3\"")
                 (format #f "~s" (search-input-file inputs "bin/python"))))
              (substitute* "avocado/utils/memory.py"
                (("\"sync\"")
                 (format #f "~s" (search-input-file inputs "bin/sync")))
                (("/bin/sh")
                 (search-input-file inputs "bin/sh")))
              ;; Batch process the tests modules with less care; if something
              ;; is wrong, the test suite will fail.  These are tests
              ;; dependencies (native inputs).
              (substitute* (find-files "selftests" "\\.py$")
                (("#!/usr/bin/env")
                 (string-append "#!" (search-input-file (or native-inputs inputs)
                                                        "bin/env")))
                (("/bin/(false|true|sh|sleep|sudo)" _ name)
                 (search-input-file (or native-inputs inputs)
                                    (string-append "bin/" name))))))
          (add-after 'unpack 'remove-broken-entrypoints
            ;; The avocado-external-runner entry point fails to load, the
            ;; 'scripts' top level package not being found (see:
            ;; https://github.com/avocado-framework/avocado/issues/5370).
            (lambda _
              (substitute* "setup.py"
                (("\"avocado-external-runner = scripts.external_runner:main\".*")
                 ""))))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (setenv "HOME" "/tmp")
                (setenv "PYTHONPATH" (getcwd))
                (invoke "./selftests/check.py" "--skip" "static-checks")))))))
    (native-inputs (list bash-minimal coreutils-minimal perl sudo))
    (inputs (list bash-minimal coreutils-minimal))
    (home-page "https://avocado-framework.github.io/")
    (synopsis "Tools and libraries to help with automated testing")
    (description "Avocado is a set of tools and libraries to help with
automated testing, i.e. a test framework.  Native tests are written in Python
and they follow the unittest pattern, but any executable can serve as a
test.  The following output formats are supported:
@table @asis
@item xUnit
an XML format that contains test results in a structured form, and are used by
other test automation projects, such as Jenkins.
@item JSON
a widely used data exchange format.  The JSON Avocado plugin outputs job
information, similarly to the xunit output plugin.
@item TAP
Provides the basic TAP (Test Anything Protocol) results.  Unlike most existing
Avocado machine readable outputs this one is streamlined (per test results).
@end table")
    (license license:gpl2)))

(define-public python-avocado-framework-plugin-result-html
  (package
    (name "python-avocado-framework-plugin-result-html")
    (version "103.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "avocado-framework-plugin-result-html" version))
       (sha256
        (base32 "02dfc2jlxpg2mpha5s1hh3afjxy8563h8sp79hbd1568s74dvk2b"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-jinja2
           python-avocado-framework))
    (home-page "https://avocado-framework.github.io/")
    (synopsis "A plugin for the Avocado testing framework.")
    (description "This optional plugin creates beautiful human readable results for the
Avocado testing framework.")
    (license license:gpl2)))

(define-public ucore-gcc-toolchain
  (cross-gcc-toolchain "riscv64-unknown-elf" #:libc #f))
