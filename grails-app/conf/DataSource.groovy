dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "epublisher"
    password = "epublisher"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://192.168.0.10:5432/needtovisit_dev"

        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://192.168.0.10:5432/needtovisit_test"

        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://192.168.0.10:5432/needtovisit"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }
}
