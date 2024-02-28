(use-modules (gnu packages bash))
(use-modules (gnu packages vim))
(use-modules (gnu packages base))
(use-modules (gnu packages less))
(use-modules (gnu packages gdb))
(use-modules (gnu packages gcc))
(use-modules (gnu packages build-tools))
(use-modules (gnu packages python))
(use-modules (gnu packages llvm))
(use-modules (gnu packages version-control))
(use-modules (gnu packages certs))
(use-modules (gnu packages curl))
(use-modules (gnu packages valgrind))

(use-modules (ucore packages))

(packages->manifest (list gcc
                          bash
                          coreutils
                          vim
                          gnu-make
                          sed
                          grep
                          less
                          gdb-multiarch
                          findutils
                          python
                          python-avocado-framework
                          python-avocado-framework-plugin-result-html
                          clang
                          git
                          nss-certs
                          curl
                          valgrind))
