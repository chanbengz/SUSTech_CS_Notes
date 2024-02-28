from avocado import Test
from avocado.utils import build as avocado_build
from avocado.utils import process as avocado_process

from pathlib import Path

VALGRIND = "valgrind"
VALGRIND_OPTIONS = "--track-origins=yes --leak-check=full --error-exitcode=99"


class IOTest(Test):
    def setUp(self):
        self.project_root = Path(self.basedir).parent
        self.log.debug(f"The project root is {self.project_root}")
        result = avocado_build.run_make(self.project_root, extra_args="O=build")
        self.assertEqual(result.exit_status, 0)

    def compare_output(self, name: str, res_visitor, leak_check: bool):
        input_path = self.get_data(f"{name}_input", must_exist=True)
        prelude = f"{VALGRIND} {VALGRIND_OPTIONS} " if leak_check else ""
        result = avocado_process.run(
            f"{prelude}build/src/main < {input_path}",
            shell=True,
            ignore_status=True,
        )
        # assertions
        res_visitor(result)
        stdout_expected_path = self.get_data(f"{name}_expected", must_exist=True)
        with open(stdout_expected_path, mode="rb") as f:
            stdout_expected = f.read()
            self.assertEqual(
                result.stdout.decode("utf-8", "strict").rstrip("\n"),
                stdout_expected.decode("utf-8", "strict").rstrip("\n"),
                "The output is not as expected",
            )

    def abnormal_rm_status_assert(self, res):
        self.assertNotEqual(res.exit_status, 0, "Expecting a non-zero exit status")
        self.assertNotEqual(res.exit_status, 99, "Memory issues detected")

    def test_rm_empty_lists(self):
        self.compare_output("rm_empty_int_list", self.abnormal_rm_status_assert, True)
        self.compare_output("rm_empty_str_list", self.abnormal_rm_status_assert, True)
        self.compare_output("rm_empty_uint_list", self.abnormal_rm_status_assert, True)

    def simple_status_assert(self, res):
        self.assertNotEqual(res.exit_status, 99, "Memory issues detected")
        self.assertEqual(res.exit_status, 0, "Expecting a zero for the exit status")

    def test_simple_lists(self):
        self.compare_output("simple_int_list", self.simple_status_assert, True)
        self.compare_output("simple_str_list", self.simple_status_assert, True)
        self.compare_output("simple_uint_list", self.simple_status_assert, True)
