# open-xhp-specification

An ad hoc specification of the behaviors of xhp-lib and sgml-stream

## Archived

This repository has been archived in June of 2025. This archival does not affect sgml-stream or xhp-lib.

Xhp-lib was archived in early 2024. Sgml-stream is still receiving updates. The tests in this test suite still have value and have been ported to sgml-stream repository. Continued comparision with xhp-lib is useless, since xhp-lib will not receive updates anymore.

---

_Important to note. This "specification" is not prescriptive. It describes xhp-lib and sgml-stream as they behave right now. If their behavior changes, which causes a test to fail, this may not be the library at fault._

For the list of behaviors which differ between the two libraries, see [behavior differences](./behavior_differences.md). The differences are written in a `Given ... Then` format. When the situation as described in `Given` occurs, `Then x will happen`. Most behaviors between the libraries are identical. Some differ because of implementation details. Others differ because of a different choice made by the library developers. Do not take these descriptions as guarantees of their behavior in the future. That would be the definition of [Hyrum's Law](https://www.hyrumslaw.com/). We do not want to restrict the developers from changing their implementations in the future.

This project only attempts to identify differences between behavior's which ae supported by both libraries. Functionality that is not supported by one of the two libraries is technically _a difference of behavior_, but we will not point this out. For features which sgml-stream chose not to support, see [sgml-stream on Github](https://github.com/hershel-theodore-layton/sgml-stream).

## How to run tests

This repository is a bit of a unicorn. You can't just run tests using `vendor/bin/hacktest tests` and get the full result. See [Fooling the typechecker](#fooling-the-typechecker). You can run tests on both sgml-stream and xhp-lib in one run using `make run_all_tests`. If you just want to test one library quickly, switch to that library using `make switch_to_...`. Then run `make run_tests`. Your code is typechecked on switching and will continue to be typechecked after. You don't need to switch each time you want to run tests. Your current active probject is _remembered_ until you switch again or use `make run_all_tests`. If you have not switched to a project, you can type broken code in your IDE, and you will not get type errors until you switch. It isn't pretty, but it does the job.

## Fooling the typechecker

This repository uses a single set of tests for both libraries. This ensures that the tests can never get out of sync. This means that there are two definitions of some symbols. `<tag:herp_and_derp>` is defined twice for example. Once with xhp-lib and once with sgml-stream. We swap out `.hhconfig` and `hh_autoload.json` between running the tests. One file ignores the xhp-lib definitions, the other ignores sgml-stream. See `ignored_paths = [ ... ]` in `xtract/.../.hhconfig`. Because of this trickery ust must set `hhvm.autoload.enabled = false` in your ini file.

Tricking Hack like this is most likely not what the engineers at Facebook had in mind when they added that `.hhconfig` flag. If this ends up being broken in a future release of hhvm, we'll have to move files in and out of the source root instead. But, _it works for now._ We should probably put that on the common Developer Coat of Arms.

Methods on sgml-stream are not xhp-lib compatible. So some free standing functions like `get_attributes()` call the type appropriate API for each library.
