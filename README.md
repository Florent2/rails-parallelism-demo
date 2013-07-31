This is the Rails application used for the demos of the [Handling requests in parallel in Rails applications, an introduction]() presentation.

If you want to run the load tests, first install a HTTP load testing tool, for instance [siege](http://www.joedog.org/siege-home/).

Then setup the application:

* `$ git clone https://github.com/Florent2/rails-parallelism-demo`
* `cd rails-parallelism-demo`
* `bundle`

To start the web server:

* with WEBrick: `$ bundle exec rails server webrick`
* with Puma:    `$ bundle exec rails server puma`
* with Unicorn: `$ bundle exec unicorn_rails -c config/unicorn.rb -p 3000` (configured to run with 4 workers)

To run a load test on the IO bound endpoint,  use the `http://localhost:3000/io-bound` URL.
To run a load test on the CPU bound endpoint, use the `http://localhost:3000/cpu-bound` URL.

Load test example with Siege:

`$ siege -b -t15S http://localhost:3000/cpu-bound`

    ** SIEGE 3.0.0
    ** Preparing 15 concurrent users for battle.
    The server is now under siege...
    HTTP/1.1 200   1.01 secs:      39 bytes ==> GET  /cpu-bound
    HTTP/1.1 200   1.18 secs:      39 bytes ==> GET  /cpu-bound
    ....
    HTTP/1.1 200   3.23 secs:      39 bytes ==> GET  /cpu-bound

    Lifting the server siege...      done.

    Transactions:              53 hits
    Availability:      100.00 %
    Elapsed time:       14.16 secsData transferred:        0.00 MB
    Response time:        3.43 secs
    Transactionsansaction rate:        3.74 trans/sec
    Throughput:        0.00 MB/secsDataConcurrency:       12.84
    Successful transactions:          53
    Failed transactions:           0
    Longest transaction:        4.23
    Shortest    transaction:        1.01
