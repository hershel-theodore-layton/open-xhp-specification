# open-xhp-specification

An ad hoc specification of the behaviors of xhp-lib and sgml-stream

_Important to note. This "specification" is not prescriptive. It describes xhp-lib and sgml-stream as they behave right now. If their behavior changes, which causes a test to fail, this may not be the library at fault._

For the list of behaviors which differ between the two libraries, see [behavior differences](./behavior_differences.md). The differences are written in a `Given ... Then` format. When the situation as described in `Given` occurs, `Then x will happen`. Most behaviors between the libraries are identical. Some differ because of implementation details. Others differ because of a different choice made by the library developers. Do not take these descriptions as guarantees of their behavior in the future. That would be the definitions of [Hyrum's Law](https://www.hyrumslaw.com/). We do not want to restrict the developers from changing their implementations in the future.

This project only attempts to identify differences between behavior's which ae supported by both libraries. Functionality that is not supported by one of the two libraries is technically _a difference of behavior_, but we will not point this out. For features which sgml-stream chose not to support, see [sgml-stream on Github](https://github.com/hershel-theodore-layton/sgml-stream).
