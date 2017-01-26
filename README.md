# **Habitat Demo**

This repo provides the basics for a Habitat demo consisting of 3 services: HAProxy, Tomcat, and MongoDB. Tomcat runs a National Parks application that displats the National Parks throughout the USA on a map.

Getting Started

To start the demo, clone this repo, `cd` into the resulting directory, and run the following.

```
habdemo $ docker-compose up
```

This will launch 3 containers, one for each service. By default, the MongoDB service launches as misconfigured. To launch a functional appstack, use the `docker-compose-done.yml` file instead of the default `docker-compose.yml`.


```
habdemo $ docker-compose -f docker-compose-done.yml
```

To fix the misconfigured MongoDB service, launch the `habitat/utility` container image - a container image to interact with the [Habitat supervisors](https://www.habitat.sh/docs/concepts-supervisor/) - in a second terminal.


```
habdemo $ ./run_util.sh
```

This launches the utility container on the appropriate network and drops you into a bash shell on that container. To reconfigure MongoDB, run the `apply_mongo_config.sh` script, passing the IP of the MongoDB container.

```
[root@cf651c234c50 /]# cd /habdemo
[root@cf651c234c50 habdemo]# ./apply_mongo_config.sh 172.18.0.3
```

In your first terminal you should see the MongoDB service reconfigure itself, then the National Parks service successfully start. You should be able to interact with the application via the URL [http://127.0.0.1:8080/national-parks](http://127.0.0.1:8080/national-parks).

You can also reconfigure HAProxy to enable the status page which is useful to show scaling of the application service. 

```
[root@cf651c234c50 habdemo]# ./apply_haproxy_config.sh 172.18.0.4
```

The HAProxy status page can be accessed via the URL [http://127.0.0.1:9000/haproxy-status](http://127.0.0.1:9000/haproxy-stats) (u:admin p:password). 

You can scale the application tier by using `docker-compose`.

```
habdemo $ docker-compose scale national-parks=10
```

This will launch nine additional containers and join them to the application's [service group](https://www.habitat.sh/docs/run-packages-service-groups/). Refresh the HAProxy status page to see that HAProxy automatically added the new containers to it's service. You can validate that all application servers are taking traffic by running `ab` (Apache Benchmark).

```
habdemo $ ab -n5000 http://127.0.0.1:8080/national-parks
```

Refreshing the HAProxy status page will show the `Sessions` count rising while `ab` executes, thus validating HAProxy properly reconfigured itself.

The [Supervisor API](https://www.habitat.sh/docs/run-packages-monitoring/) for HAProxy can be accessed via the URL [http://127.0.0.1:9631](http://127.0.0.1:9631). Below are some URLs to show information the API exposes.

* [http://127.0.0.1:9631/services](http://127.0.0.1:9631/services)
* [http://127.0.0.1:9631/services/haproxy/default/config](http://127.0.0.1:9631/services/haproxy/default/config)
* [http://127.0.0.1:9631/butterfly](http://127.0.0.1:9631/butterfly)
* [http://127.0.0.1:9631/census](http://127.0.0.1:9631/census)





