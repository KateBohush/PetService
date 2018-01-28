# api_tests
# Environment variables
    ENV=(test, stage, uat, sandbox01)
    NUMBER_OF_PROCESSORS=(1-4); 4 is by default
    SUITE=(end-to-end, services)
# Suites
Project consist of two suites: end-to-end and services. End-to-end is testing only of valid flows without any preconditions previously set, services suite is developed to test each service endpoint in isolation with full coverage including all edge cases. To run one or another suite in command line specify rspec specs/end_to_end_specs or rspec specs/services_specs

# Parallel run
There is possibility to run tests in parallel: 
      parallel_rspec specs/end_to_end_specs
      parallel_rspec specs/services_specs
but report generation behaviour is unpredictable in such situation
