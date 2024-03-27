from avocado import Test
from avocado.utils import build as avocado_build
from avocado.utils import process as avocado_process

from pathlib import Path


class FilesTest(Test):
    def setUp(self):
        self.project_root = Path(self.basedir).parent
        self.log.debug(f"The project root is {self.project_root}")

    def test_file_diff(self):
        try:
            result = avocado_build.run_make(self.project_root, extra_args="diff_check")
            self.assertEqual(result.exit_status, 0, "Unexpected changes in files")
        except avocado_process.CmdError as details:
            self.fail("The diff check failed. There are unexpected changes in files.")
