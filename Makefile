run_all_tests: switch_to_sgml_stream run_tests_again whitespace switch_to_xhp_lib run_tests

run_tests:
	hhvm test_preamble.hack
	vendor/bin/hacktest tests

## Keep in sync with run_tests
run_tests_again:
	hhvm test_preamble.hack
	vendor/bin/hacktest tests

switch_to_sgml_stream:
	cp -R xtract/sgml-stream/. .
	hh_client restart >/dev/null 2>&1
	hh_client
	vendor/bin/hh-autoload >/dev/null

switch_to_xhp_lib:
	cp -R xtract/xhp-lib/. .
	hh_client restart >/dev/null 2>&1
	hh_client
	vendor/bin/hh-autoload >/dev/null

whitespace:
	echo -e "\n\n\n"
