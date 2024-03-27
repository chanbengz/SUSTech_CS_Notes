from avocado import Test
from avocado.utils import build as avocado_build
from avocado.utils import process as avocado_process

from pathlib import Path


class SimpleTest(Test):
    def setUp(self):
        self.project_root = Path(self.basedir).parent
        self.log.debug(f"The project root is {self.project_root}")

    def test_output(self):
        result = avocado_build.run_make(self.project_root, extra_args="-s qemu")
        stdout_expected_path = self.get_data("stdout_expected", must_exist=True)
        with open(stdout_expected_path, mode="rb") as f:
            stdout_expected = f.read()
            self.assertEqual(
                result.stdout, stdout_expected, "The output is not as expected"
            )
